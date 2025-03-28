(* ::Package:: *)

BeginPackage["QuantumMob`QuantumPlaybook`Custom`", {"QuantumMob`Q3`"}]

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

  (* Specials *)
  
  SetOptions[BlochSphere, ImageSize -> 250];
  
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
      ParametricPlot3D },
    Axes -> True
  ];
]

End[]

EndPackage[]
