(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2021-04-05 09:50:58+09 $ *)
(* $Revision: 1.5 $ *)

BeginPackage["QuantumWorkbook`"]

Unprotect[Evaluate[$Context<>"*"]]
ClearAll[Evaluate[$Context<>"*"]]

{ QuantumWorkbookUpdate, QuantumWorkbookCheckUpdate };
{ QuantumWorkbookEdition };

Begin["`Private`"]

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

QuantumWorkbookUpdate::usage = "QuantumWorkbookUpdate[] installs the latest update of the package."

QuantumWorkbookUpdate[opts___?OptionQ] := (
  serverEnsure[];
  PacletInstall["QuantumWorkbook", opts]
 )


QuantumWorkbookCheckUpdate::usage = "QuantumWorkbookCheckUpdate[] checks if there is a newer release of QuantumWorkbook in the GitHub repository."

QuantumWorkbookCheckUpdate[] := Module[
  { pac, new },
  serverEnsure[];
  pac = PacletFind["QuantumWorkbook"];
  new = PacletFindRemote["QuantumWorkbook", UpdatePacletSites->True];
  If[ pac=={}, Return[$Failed], pac = pacletVersion[pac] ];
  If[ new=={}, Return[$Failed], new = pacletVersion[new] ];
  If[ OrderedQ @ {versionNumber @ new, versionNumber @ pac},
    Print["You are using the latest release v", pac, " of QuantumWorkbook."],
    Print["QuantumWorkbook,v", new, " is now available -- you are using v",
      pac, ".\nUse QuantumWorkbookUpdate to install the update."]
   ]
 ]


QuantumWorkbookEdition::usage = "QuantumWorkbookEdition[] returns the edition of the current compilation of workbook chapters."

QuantumWorkbookEdition::nobk = "No complilation of the Workbook chapters is found."

QuantumWorkbookEdition[] := Module[
  { pac = PacletFind["QuantumWorkbook"] },
  If[ pac == {},
    Message[QuantumWorkbookEdition::nobk];
    Return[$Failed],
    pac = First @ pac
   ];
  StringJoin[
    "A Quantum Computation Workbook (draft ", pac["Year"], "), ",
    "Mathematica Notebook Compilation ", pac["Version"], "."
   ]
 ]


End[]

Protect[Evaluate[$Context<>"*"]]

EndPackage[]
