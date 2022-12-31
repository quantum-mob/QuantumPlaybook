(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2022-12-31 12:24:46+09 $ *)
(* $Revision: 1.1 $ *)

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
  Pause[5]
 ];

(**** </QuantumWorkbook> *****)


(***** <Paclet Server> ****)

$serverURL = "https://github.com/quantum-mob/PacletServer/raw/main"

serverRegisteredQ[url_:$serverURL] := Module[
  { ps = PacletSites[] },
  MemberQ[ Through[ps["URL"]], url ]
 ]

serverRegister[url_:$serverURL] :=
  PacletSiteUpdate @ PacletSiteRegister[url, "Quantum Mob Paclet Server"]

serverEnsure[] := If[ serverRegisteredQ[], Null, serverRegister[] ]

pacletVersion[pp:{__PacletObject}] := pacletVersion[First @ pp]

pacletVersion[pac_PacletObject] := pac["Version"]

versionNumber[vv:{__String}] := versionNumber[First @ vv]

versionNumber[ver_String] := With[
  { new = StringSplit[ver, "."] },
  If[ AllTrue[new, DigitQ],
    ToExpression @ new,
    ver
   ]
 ]

(***** </Paclet Server> ****)

QuantumPlaybookUpdate::usage = "QuantumPlaybookUpdate[] installs the latest update of the package."

QuantumPlaybookUpdate[opts___?OptionQ] := (
  serverEnsure[];
  PacletInstall["QuantumPlaybook", opts]
 )


QuantumPlaybookCheckUpdate::usage = "QuantumPlaybookCheckUpdate[] checks if there is a newer release of QuantumPlaybook in the GitHub repository."

QuantumPlaybookCheckUpdate[] := Module[
  { pac, new },
  serverEnsure[];
  pac = PacletFind["QuantumPlaybook"];
  new = PacletFindRemote["QuantumPlaybook", UpdatePacletSites->True];
  If[ pac=={}, Return[$Failed], pac = pacletVersion[pac] ];
  If[ new=={}, Return[$Failed], new = pacletVersion[new] ];
  If[ OrderedQ @ {versionNumber @ new, versionNumber @ pac},
    Print["You are using the latest release v", pac, " of QuantumPlaybook."],
    Print["QuantumPlaybook,v", new, " is now available -- you are using v",
      pac, ".\nUse QuantumPlaybookUpdate to install the update."]
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
    "A Quantum Computation Workbook (draft ", pac["Year"], "), ",
    "Mathematica Notebook Compilation ", pac["Version"], "."
   ]
 ]


End[]

SetAttributes[Evaluate @ Protect["`*"], ReadProtected];

EndPackage[]
