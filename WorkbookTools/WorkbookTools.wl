BeginPackage["WorkbookTools`", "Handy`Basics`"]
Unprotect[Evaluate[$Context<>"*"]]

Authoring`Private`$Version = StringJoin[
  $Input, " v",
  StringSplit["$Revision: 2.13 $"][[2]], " (",
  StringSplit["$Date: 2021-04-03 21:08:35+09 $"][[2]], ") ",
  "Mahn-Soo Choi"
 ]

{ SetBanner, UnsetBanner };
{ WorkbookCopy };

{ FilterCells };

{ ExportCells, ExportBundles, Bundle, Bundles };

{ NotebookStyleSheet };


Begin["`Private`"]

NotebookStyleSheet::usage = "NotebookStyleSheet[] returns the name of the style sheet used in the current notebook."

NotebookStyleSheet[] := NotebookStyleSheet @ EvaluationNotebook[]

NotebookStyleSheet[nb_NotebookObject] :=
  NotebookStyleSheet @ CurrentValue[nb, StyleDefinitions]

NotebookStyleSheet[stysht:(_FileName | _FrontEnd`FileName)] :=
  NotebookStyleSheet @ ToFileName @ stysht
(* NOTE: Documentation Center (v12.2) says that ToFileName has been superseded
   by FileNameJoin, but FileNameJoin does not work for this case. *)

NotebookStyleSheet[name_String?FileExistsQ] := AbsoluteFileName[name]

NotebookStyleSheet[name_String] := Block[
  { $Path = ToFileName /@ AbsoluteCurrentValue[StyleSheetPath] },
  $Path = Flatten[ FileNames /@ $Path ];
  FindFile[name]
 ]
(* NOTE: Documentation Center warns that StyleSheetPath has not been fully
   integrated into the long-term Wolfram Language.*)


SetBanner::usage = "SetBanner[title, options] adds a banner of title to the top of the current notebook by setting the DockedCells option. Additional options can be set."

$Banner = "Quantum Computing Workbook";

SetBanner[file_String, title_String:$Banner, opts___?OptionQ] :=
  SetBanner[NotebookOpen[file], title, opts]

SetBanner[title_String:$Banner, opts___?OptionQ] :=
  SetBanner[InputNotebook[], title, opts]

SetBanner[nb_NotebookObject, title_String:$Banner, opts___?OptionQ] :=
  SetOptions[
    nb, 
    DockedCells -> Cell[
      title, "Text", opts,
      Background -> GrayLevel[0.9],
      FontSize -> 12,
      CellFrameMargins -> {{22, 8}, {8, 8}}
     ],
    PageFooters -> {
      { Cell[$Banner, "Footer", CellMargins -> 4], None, None },
      { None, None, Cell[$Banner, "Footer", CellMargins -> 4] }
     },
    PageFooterLines -> {True, True}
   ]


UnsetBanner::usage = "UnsetBanner[] removes the banner of the current notebook."

UnsetBanner[] := UnsetBanner @ InputNotebook[]

UnsetBanner[file_String] := UnsetBanner @ NotebookOpen[file]

UnsetBanner[nb_NotebookObject] := SetOptions[nb, DockedCells -> None]


WorkbookCopy::usage = "WorkbookCopy[filename] saves the notebook specified by the filename in the folder Workbooks with proper options.."

WorkbookCopy::nocopy = "Could not copy file `` to ``."

WorkbookCopy::noopen = "Could not open file ``."

WorkbookCopy::nosty = "Could not find a style sheet of ``."

WorkbookCopy[file_String] := Module[
  { new, sty, nb },
  new = FileNameJoin @ {
    DirectoryName[file],
    "QuantumWorkbook", "Documentation", "English", "Workbook",
    FileNameTake[file]
   };

  If[ FailureQ @ CopyFile[file, new, OverwriteTarget -> True],
    Message[WorkbookCopy::nocopy, file, new];
    Return[$Failed]
   ];

  If[ FailureQ[nb = NotebookOpen @ new],
    Message[WorkbookCopy::noopen, new];
    Return[$Failed]
   ];

  If[ FailureQ[sty = NotebookStyleSheet @ nb],
    Message[WorkbookCopy::nosty, new]
   ];
  
  SetBanner[nb];
  SetOptions[ nb,
    StyleDefinitions -> Get[sty],
    (* embedding the style sheet into the notebook file *)
    Saveable -> False
   ];
  NotebookSave[nb, new];
  NotebookClose[nb];
 ]


(**** <ExportCells> ****)

ExportCells::usage = "ExportCells[file] exports individual cells."

ExportCells::nofile = "Cannot find the notebook ``."

ExportCells::noopen = "Cannot open the notebook ``."

ExportCells::nodel = "Could not empty the directory ``."

ExportCells[file_String] := Module[
  { nb, cc, bb },
  If[ FileExistsQ[file],
    Print[file, " ..."],
    Message[ExportCells::nofile, file];
    Return[$Failed]
   ];

  $BundlesFolder = file <> "c";
  
  If[ FailureQ @ DeleteFile @ FileNames[All, $BundlesFolder],
    Message[ExportCells::nodel, dir]
   ];

  nb = NotebookOpen[file];
  If[ FailureQ[nb],
    Message[ExportCells::noopen, file];
    Return[nb]
   ];
  cc = Bundles[nb];
  NotebookClose[nb];
  bb = Bundles[cc];
  ExportBundles[bb];
 ]


ClearAll[FilterCells];

FilterCells::usage = "FilterCells[expr, type] returns a list of cells or cell groups of cell style type.\nFilterCell[expr, type1|type2|...] returns a list of cells or cell groups of style typ1 or typ2 or ....\nFilterCell[expr,{typ1, type2, ...}] is equivalent to FilterCells[expr, type1|type2|...].\nFilterCells is similar to Cells with the option CellStyle, but the important difference is that FilterCells keep the cell groups."

FilterCells[expr_, tt:{_String, __String}] :=
  FilterCells[expr, Alternatives @@ tt]

FilterCells[expr_, {type_String}] :=
  FilterCells[expr, type]

FilterCells[expr_, type_] := Module[
  { cc, Dell },
  cc = ReplaceAll[
    expr,
    { Cell[gg:CellGroupData[{Cell[_, type, ___], ___}, ___], rest___] ->
        Dell[gg, rest],
      Cell[a_, type, rest___] -> Dell[a, type, rest]
     }
   ];
  Cases[{cc}, Dell[a__] -> Cell[a], Infinity]
 ]


ClearAll[Bundles]

Bundles::usage = "Bundles[nbObj] returns the list of cells bundled properly."

(*
Bundles[nb_NotebookObject] := Module[
  { cc = First @ NotebookGet[nb] },
  Cases[ cc, 
    Cell[CellGroupData[{Cell[_, "Section", ___], rest___}, ___], ___] :> {rest},
    Infinity
   ] /. HoldPattern[CellChangeTimes -> _] -> Sequence[]
 ]
 *)

Bundles[nb_NotebookObject] := FilterCells[NotebookGet[nb], "Section"]

Bundles[bb_List] := Block[
  { CellGroupData },

  CellGroupData /:
  Cell[
    CellGroupData[
      {Cell[_, "Section" | "Subsection" | "Subsubsection", ___], rest___},
      ___ ],
    ___
   ] := {rest};
  
  CellGroupData /:
  Cell[CellGroupData[{Cell[a_, "MathCaption", b___], rest___}, ___], ___] :=
    Bundle[
      Cell[a, "Text", CellFrame -> {{0, 0}, {0, 0.5}}, b],
      rest
     ];
  
  bb /. {Cell[_, "Section" | "Subsection" | "Subsubsection", ___] -> {}}
 ]


ExportBundles::usage = "ExportBundles[bb] exports bundles."

ExportBundles[bb_List] := ExportBundles[bb, {}]

ExportBundles[{}, jj:{___Integer}] := Nothing;


ExportBundles[bb:{__List}, jj:{___Integer}] := 
  MapIndexed[ExportBundles[#1, Join[jj, #2]]&, bb]

ExportBundles[{cc__, bb__List}, jj:{___Integer}] := 
  MapIndexed[ExportBundles[#1, Join[jj, #2 - 1]]&, {{cc}, bb}]

ExportBundles[bb:{__Bundle}, jj:{___Integer}] := 
  ExportBundles[bb, Append[jj, 0]] /; Length[jj] < 2

ExportBundles[bb:{__Bundle}, jj:{___Integer}] := 
  MapIndexed[ExportBundles[#1, Join[jj, #2]]&, bb]

ExportBundles[{cc__, bb___Bundle}, jj:{___Integer}] := 
  ExportBundles[{Bundle[cc], bb}, Append[jj, 0]] /; Length[jj] < 2

ExportBundles[{cc__, bb___Bundle}, jj:{___Integer}] := 
  MapIndexed[ExportBundles[#1, Join[jj, #2]]&, {Bundle[cc], bb}]


ExportBundles[Bundle[cc__], jj:{___Integer}] := Module[
  { ff = Range @ Length @ {cc} },
  ff = pdfFileName /@ Thread @ Append[jj, ff];
  writeLaTeX[texFileName @ jj, ff];
  exportCell @@@ Transpose @ {ff, {cc}};
 ]

writeLaTeX[tex_String, ff:{__String}] := Module[
  { gg = FileNameTake[#, -2]& /@ ff },
  gg = StringJoin[
    "\\begin{mathbundle}\n",
    Thread @ {"\\includemathcell{", gg, "}\n"},
    "\\end{mathbundle}\n"
   ];
  Export[tex, gg, "Text"];
 ]

exportCell[file_String, expr:Cell[_, "Text", ___]] := Module[
  { new },
  Print["\t", FileNameTake @ file];
  new = Cell[
    CellGroupData[{expr, Cell["", "Text"]}, Closed],
    CellBracketOptions -> {"Color" -> GrayLevel[0.9]}
   ];
  ExportCrop[file, new];
 ]

exportCell[file_String, expr:Cell[_, "Input", ___]] := Module[
  { new },
  Print["\t", FileNameTake @ file];
  new = Cell[
    CellGroupData[{expr, Cell["", "Output"]}, Closed],
    CellBracketOptions -> {"Color" -> GrayLevel[0.9]}
   ];
  ExportCrop[file, new];
 ]

exportCell[file_String, expr:Cell[_CellGroupData, ___]] := (
  Print["\t", FileNameTake @ file];
  ExportCrop[file, expr];
 )

texFileName[jj:{__Integer}] := FileNameJoin @ {
  $BundlesFolder,
  StringJoin @ Riffle[ToString /@ jj, {".", "-"}] <> ".tex"
 }

pdfFileName[jj_List] := FileNameJoin @ {
  $BundlesFolder,
  StringJoin @ Riffle[ToString /@ jj, {".", "-"}] <> ".pdf"
 }

(**** </ExportCells> ****)


(**** <Customizations> ****)

$UserGraphicsOptions = {
  Axes -> False,
  Frame -> True,
  FrameStyle -> Automatic,
  PlotRangePadding -> Scaled[0.025],
  PlotStyle -> Automatic,
  GridLines -> Automatic,
  ImageSize -> Automatic
 };

$UserGraphics3DOptions = {
  PlotStyle -> Automatic,
  AxesStyle -> Automatic,
  ImageSize -> Automatic
 };

SetOptions[
  Graphics,
  AxesStyle -> Automatic,
  FrameStyle -> Automatic,
  ImageSize -> Automatic
 ]

SetOptions[
  Graphics3D,
  AxesStyle -> Automatic,
  ImageSize -> Automatic
 ]

SetOptions[
  { Plot, ParametricPlot,
    LogPlot, LogLinearPlot, LogLogPlot,
    ListPlot, ListLinePlot, ListLogPlot, ListLogLinearPlot, ListLogLogPlot },
  Sequence @@ $UserGraphicsOptions
 ]

SetOptions[
  Histogram,
  FilterRules[ $UserGraphicsOptions, Options @ Histogram ] 
 ]

SetOptions[
  { Plot3D, ParametricPlot3D },
  Sequence @@ $UserGraphics3DOptions
 ]

(**** </Customizations> ****)


End[]


Authoring`Private`symbs = Protect[Evaluate[$Context<>"*"]]

SetAttributes[Evaluate[Authoring`Private`symbs], {ReadProtected}]

EndPackage[]
