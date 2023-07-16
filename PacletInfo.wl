(* Paclet Info File *)

(* $Date: 2023-07-17 00:59:50+09 $ *)
(* $Revision: 1.66 $ *)

Paclet[
  "Name" -> "QuantumPlaybook",
  "Version" -> "3.2.18",
  "WolframVersion" -> "12.3+",
  "Loading" -> Automatic,
  "Updating" -> Automatic,
  "Extensions" -> {
    { "Kernel",
      "Root" -> "Kernel",
      "Context" -> { "QuantumPlaybook`", "QuantumPlaybook`Custom`" },
      (* Context specifies the package context or list of contexts . Used by
         FindFile. Also causes documentation links to be added to usage
         messages when documentation is present. *)
      "Symbols" -> {
        "QuantumPlaybookEdition",
        "QuantumPlaybookUpdate",
        "QuantumPlaybookCheckUpdate"
       }
      (* Symbols supplies a set of symbols that the paclet provides. If the
         Loading is set to Automatic , autoloading will be set up for everyone
         of these symbols. *)
     },
    { "Kernel",
      "Root" -> "Transmon/Kernel",
      "Context" -> "Transmon`"
     },
    { "Kernel",
      "Root" -> "Solovay/Kernel",
      "Context" -> "Solovay`"
     },
    { "Documentation",
      "Language" -> "English",
      "MainPage" -> "Tutorials/QuantumPlaybook" },
    { "Asset",
      (* Similar to the old-style Resource extension. *)
      (* The documented way to extract the named asset from Asset extensions
         is pacletObj["AssetLocation", "assetname"]. *)
      "Root" -> "Samples",
      "Assets" -> {
        {"Book", "QuantumPlaybook.pdf"},
        {"FrontMatter", "FrontMatter.pdf"},
        {"Chapter2", "Chapter2.pdf"},
        {"BackMatter", "BackMatter.pdf"},
        {"Errata", "Errata.pdf"}
       }
     },
    { "Asset",
      "Root" -> "Data",
      "Assets" -> {
        {"Iris", "QML/Iris-Class1and2-Scaled.txt"}
       }
     }
   },
  "Description" -> "Mathematica Notebook files accompanying the Quantum Computation Workbook.",
  "Creator" -> "Mahn-Soo Choi (Korea University)",
  "Year" -> "2022", (* custom field *)
  "URL" -> "https://github.com/quantum-mob/QuantumPlaybook",
  "Category" -> "Education"
 ]
