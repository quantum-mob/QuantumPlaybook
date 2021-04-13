(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2021-04-13 12:21:14+09 $ *)
(* $Revision: 1.10 $ *)

BeginPackage["QuantumWorkbook`Custom`", {"Q3`Custom`"}]

(* General usuers do not need WorkbookTools` any longer. *)
If[ MemberQ[{"Okoye", "Leona", "Lijia"}, $MachineName], Null,
  Quiet @ PacletUninstall["WorkbookTools"]
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
    ImageSize -> Automatic
   };

  (* Graphics *)

  Customization[Graphics, Frame -> False, Axes -> False, GridLines -> None];

  (* Graphics-related functions *)

  Customization @ {
    Histogram,
    Plot, ParametricPlot, LogPlot, LogLinearPlot, LogLogPlot,
    ListPlot, ListLinePlot, ListLogPlot, ListLogLinearPlot, ListLogLogPlot
   };

  (* Graphics3D-related functions *)

  Customization[Graphics3D];

  Customization[
    { Plot3D,
      ParametricPlot3D
     },
    Axes -> True
   ];
 ]

End[]

EndPackage[]
