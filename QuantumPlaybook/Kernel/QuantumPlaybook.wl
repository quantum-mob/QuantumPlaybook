Get["QuantumMob`Q3`"];
Q3Assure["4.1.0"];

BeginPackage["QuantumMob`QuantumPlaybook`"]

Unprotect["`*"];
ClearAll["`*"];

{ QuantumPlaybookUpdate, QuantumPlaybookCheckUpdate };
{ QuantumPlaybookEdition };

QuantumPlaybookGeneral::legacy = "A legacy version of QuantumPlaybook is removed, and instead new QuantumMob/QuantumPlaybook is installed."

QuantumPlaybookGeneral::workbook = "You still have the QuantumWorkbook package, which has been superceded by QuantumMob/QuantumPlaybook."


Begin["`Private`"]

ClearAll["`*"];

If[ Length[PacletFind @ "QuantumPlaybook"] > 0,
  Message[QuantumPlaybookGeneral::legacy];
  PacletUninstall["QuantumPlaybook"]
];

If[ Length[PacletFind @ "QuantumWorkbook"] > 0,
  Message[QuantumPlaybookGeneral::workbook];
  PacletUninstall["QuantumWorkbook"]
];


(**** <QuantumPlaybookUpdate> ****)

QuantumPlaybookUpdate::usage = "QuantumPlaybookUpdate[] installs the latest update of the package."

QuantumPlaybookUpdate::fresh = "You are using the latest release v`` of QuantumPlaybook."

QuantumPlaybookUpdate[opts___?OptionQ] := (
  PrintTemporary["Installing an update ..."];
  PacletDataRebuild[];
  Q3`Private`serverEnsure[];
  PacletInstall["QuantumMob/QuantumPlaybook", opts, UpdatePacletSites -> True]
 )

(**** </QuantumPlaybookUpdate> ****)


(**** <QuantumPlaybookCheckUpdate> ****)

serverEnsure = QuantumMob`Q3`Private`serverEnsure;
pacletVersion = QuantumMob`Q3`Private`pacletVersion;

QuantumPlaybookCheckUpdate::usage = "QuantumPlaybookCheckUpdate[] checks if there is a newer release of QuantumPlaybook in the GitHub repository."

QuantumPlaybookCheckUpdate[] := Module[
  { pac, new },
  PrintTemporary["Checking for updates ..."];
  PacletDataRebuild[];
  serverEnsure[];
  pac = PacletFind["QuantumMob/QuantumPlaybook"];
  new = PacletFindRemote["QuantumMob/QuantumPlaybook", UpdatePacletSites -> True];
  If[ pac=={}, Return[$Failed], pac = pacletVersion[pac] ];
  If[ new=={}, Return[$Failed], new = pacletVersion[new] ];
  If[ OrderedQ @ {
      versionNumber @ new,
      versionNumber @ pac },
    ToString @ StringForm[QuantumPlaybookUpdate::fresh, pac],
    PrintTemporary["QuantumPlaybook,v", new, " is now available; ",
      "you are using v", pac, "."];
    QuantumPlaybookUpdate[]
  ]
]

(**** </QuantumPlaybookCheckUpdate> ****)


QuantumPlaybookEdition::usage = "QuantumPlaybookEdition[] returns the edition of the current compilation of workbook chapters."

QuantumPlaybookEdition::nobk = "No complilation of the Workbook chapters is found."

QuantumPlaybookEdition[] := Module[
  { pac = PacletFind["QuantumMob/QuantumPlaybook"] },
  If[ pac == {},
    Message[QuantumPlaybookEdition::nobk];
    Return[$Failed],
    pac = First @ pac
  ];
  StringJoin[
    "A Quantum Playbook (", pac["Year"], ") Release ", pac["Version"], "."
  ]
]


SetAttributes[Evaluate @ Names["`*"], ReadProtected];

End[]

SetAttributes[Evaluate @ Protect["`*"], ReadProtected];

EndPackage[]
