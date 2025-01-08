Get["Q3`"];
Q3Assure["3.8.0"];


BeginPackage["QuantumPlaybook`"]

Unprotect["`*"];
ClearAll["`*"];

{ QuantumPlaybookUpdate, QuantumPlaybookCheckUpdate };
{ QuantumPlaybookEdition };

Begin["`Private`"]

(**** <QuantumWorkbook> *****)

old = PacletFind["QuantumWorkbook"];
If[ old != {},
  PrintTemporary["You still have the QuantumWorkbook package, which has been superceded by QuantumPlaybook. It is now removed ..."];
  PacletUninstall["QuantumWorkbook"];
  Pause[5];
  PacletDataRebuild[]
 ];

(**** </QuantumWorkbook> *****)


QuantumPlaybookUpdate::usage = "QuantumPlaybookUpdate[] installs the latest update of the package."

QuantumPlaybookUpdate[opts___?OptionQ] := (
  PrintTemporary["Installing an update ..."];
  PacletDataRebuild[];
  Q3`Private`serverEnsure[];
  PacletInstall["QuantumPlaybook", opts, UpdatePacletSites -> True]
 )


QuantumPlaybookCheckUpdate::usage = "QuantumPlaybookCheckUpdate[] checks if there is a newer release of QuantumPlaybook in the GitHub repository."

QuantumPlaybookCheckUpdate[] := Module[
  { pac, new },
  PrintTemporary["Checking for updates ..."];
  PacletDataRebuild[];
  Q3`Private`serverEnsure[];
  pac = PacletFind["QuantumPlaybook"];
  new = PacletFindRemote["QuantumPlaybook", UpdatePacletSites -> True];
  If[ pac=={}, Return[$Failed], pac = Q3`Private`pacletVersion[pac] ];
  If[ new=={}, Return[$Failed], new = Q3`Private`pacletVersion[new] ];
  If[ OrderedQ @ {
      Q3`Private`versionNumber @ new,
      Q3`Private`versionNumber @ pac },
    Print["You are using the latest release v", pac, " of QuantumPlaybook."],
    PrintTemporary["QuantumPlaybook,v", new, " is now available; ",
      "you are using v", pac, "."];
    QuantumPlaybookUpdate[]
   ]
 ]


QuantumPlaybookEdition::usage = "QuantumPlaybookEdition[] returns the edition of the current compilation of workbook chapters."

QuantumPlaybookEdition::nobk = "No complilation of the Workbook chapters is found."

QuantumPlaybookEdition[] := Module[
  { pac = PacletFind["QuantumPlaybook"] },
  If[ pac == {},
    Message[QuantumPlaybookEdition::nobk];
    Return[$Failed],
    pac = First @ pac
   ];
  StringJoin[
    "A Quantum Playbook (", pac["Year"], ") Release ", pac["Version"], "."
   ]
 ]


End[]

SetAttributes[Evaluate @ Protect["`*"], ReadProtected];

EndPackage[]
