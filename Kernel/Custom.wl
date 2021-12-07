(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2021-12-07 17:20:13+09 $ *)
(* $Revision: 1.14 $ *)

BeginPackage["QuantumWorkbook`Custom`", {"Q3`"}]

If[ MemberQ[{"Grace", "Okoye", "Leona", "Lijia"}, $MachineName], Null,
  Quiet @ PacletUninstall["WorkbookTools"];
  MessageDialog @ Column @ {
    Style["\[WarningSign] NOTICE", Large, Red], 
    "You have kept the old 'WorkbookTools' package.", 
    "Now it has been uninstalled."
   };
 ];

Begin["`Private`"]

Block[
  { $Customizations },
  
  $Customizations = {
    (* Graphics *)
    Axes -> False,
    Frame -> True,
    FrameStyle -> Automatic,
    GridLines -> Automatic,
    PlotRangePadding -> Scaled[0.025],
    (* Graphics3D *)
    (* Common *)
    PlotStyle -> Automatic,
    AxesStyle -> Automatic,
    ImageSize -> 250
   };

  (* Graphics *)

  Customize[Graphics, Frame -> False, Axes -> False, GridLines -> None];

  (* Graphics-related functions *)

  Customize @ {
    Histogram,
    Plot, ParametricPlot, LogPlot, LogLinearPlot, LogLogPlot,
    ListPlot, ListLinePlot, ListLogPlot, ListLogLinearPlot, ListLogLogPlot
   };

  (* Graphics3D-related functions *)

  Customize[Graphics3D];

  Customize[
    { Plot3D,
      ParametricPlot3D
     },
    Axes -> True
   ];
 ]

End[]

EndPackage[]
