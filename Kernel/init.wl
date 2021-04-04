(* -*- mode:math -*- *)
(* Mahn-Soo Choi *)
(* $Date: 2021-04-04 12:50:25+09 $ *)
(* $Revision: 1.3 $ *)

BeginPackage["QuantumWorkbook`"]

Unprotect[Evaluate[$Context<>"*"]]
ClearAll[Evaluate[$Context<>"*"]]

{ QuantumWorkbookUpdate, QuantumWorkbookCheckUpdate };

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

QuantumWorkbookUpdate::usage = "Installs the latest update of the package."

QuantumWorkbookUpdate[opts___?OptionQ] := (
  serverEnsure[];
  PacletInstall["QuantumWorkbook", opts]
 )


QuantumWorkbookCheckUpdate::usage = "QuantumWorkbookCheckUpdate[] checks if there is a newer release of QuantumWorkbook in the GitHub repository."

QuantumWorkbookCheckUpdate[] := Module[
  { pac = PacletFind["QuantumWorkbook"],
    new = PacletFindRemote["QuantumWorkbook", UpdatePacletSites->True] },
  If[ FailureQ[pac], Return[pac], pac = pacletVersion[pac] ];
  If[ FailureQ[new], Return[new], new = pacletVersion[new] ];
  If[ OrderedQ @ {versionNumber @ new, versionNumber @ pac},
    Print["You are using the latest release v", pac, " of QuantumWorkbook."],
    Print["QuantumWorkbook,v", new, " is now available -- you are using v",
      pac, ".\nUse QuantumWorkbookUpdate to install the update."]
   ]
 ]


End[]

Protect[Evaluate[$Context<>"*"]]

EndPackage[]
