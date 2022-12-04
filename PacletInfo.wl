(* Paclet Info File *)

(* $Date: 2022-12-04 01:51:39+09 $ *)
(* $Revision: 1.26 $ *)

Paclet[
  "Name" -> "QuantumWorkbook",
  "Year" -> "2021", (* custom field *)
  "Version" -> "2.1.4",
  "WolframVersion" -> "12.1+",
  "Loading" -> Automatic,
  "Updating" -> Automatic,
  "Extensions" -> {
    { "Kernel",
      "Root" -> "Kernel",
      "Context" -> { "QuantumWorkbook`", "QuantumWorkbook`Custom`" },
      (* Context specifies the package context or list of contexts . Used by
         FindFile. Also causes documentation links to be added to usage
         messages when documentation is present. *)
      "Symbols" -> {
        "QuantumWorkbookEdition",
        "QuantumWorkbookUpdate",
        "QuantumWorkbookCheckUpdate"
       }
      (* Symbols supplies a set of symbols that the paclet provides. If the
         Loading is set to Automatic , autoloading will be set up for everyone
         of these symbols. *)
     },
    { "Kernel",
      "Root" -> "Transmon/Kernel",
      "Context" -> "Transmon`"
     },
    { "Documentation",
      "Language" -> "English",
      "MainPage" -> "Tutorials/QuantumWorkbook" },
    { "Asset",
      (* Similar to the old-style Resource extension. *)
      (* The documented way to extract the named asset from Asset extensions
         is pacletObj["AssetLocation", "assetname"]. *)
      "Root" -> "Samples",
      "Assets" -> {
        {"Book", "QuantumWorkbook.pdf"},
        {"FrontMatter", "FrontMatter.pdf"},
        {"Chapter2", "Chapter2.pdf"},
        {"BackMatter", "BackMatter.pdf"},
        {"Errata", "Errata.pdf"}
       }
     }
   },
  "Description" -> "Mathematica Notebook files accompanying the Quantum Computation Workbook.",
  "Creator" -> "Mahn-Soo Choi (Korea University)",
  "URL" -> "https://github.com/quantum-mob/QuantumWorkbook",
  "Category" -> "Education"
 ]
