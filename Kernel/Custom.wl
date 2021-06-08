(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2021-06-05 21:35:35+09 $ *)
(* $Revision: 1.11 $ *)

BeginPackage["QuantumWorkbook`Custom`", {"Q3`"}]

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
