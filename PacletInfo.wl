(* Paclet Info File *)

(* $Date: 2021-04-07 10:02:41+09 $ *)
(* $Revision: 1.11 $ *)

Paclet[
  "Name" -> "QuantumWorkbook",
  "Year" -> "2021", (* custom field *)
  "Version" -> "0.1.3",
  "WolframVersion" -> "12.1+",
  "Description" -> "Mathematica Notebook files accompanying the Quantum Computation Workbook.",
  "Creator" -> "Mahn-Soo Choi (Korea University)",
  "Loading" -> Automatic,
  "AutoUpdating" -> True,
  "Extensions" -> {
    { "Kernel",
      "Root" -> "Kernel",
      "Context" -> { "QuantumWorkbook`" },
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
    { "Documentation",
      "Language" -> "English",
      "MainPage" -> "Tutorials/Contents" },
    { "Asset",
      (* Similar to the old-style Resource extension. *)
      (* The documented way to extract the named asset from Asset extensions
         is pacletObj["AssetLocation", "assetname"]. *)
      "Root" -> "Samples",
      "Assets" -> {
        {"FrontMatter", "FrontMatter.pdf"},
        {"Chapter2", "Chapter2.pdf"},
        {"BackMatter", "BackMatter.pdf"}
       }
     }
   },
  "URL" -> "https://github.com/quantum-mob/QuantumWorkbook",
  "Category" -> "Education"
 ]
