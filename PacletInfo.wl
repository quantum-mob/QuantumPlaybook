(* Paclet Info File *)

(* $Date: 2021-04-06 12:18:09+09 $ *)
(* $Revision: 1.7 $ *)

Paclet[
  "Name" -> "QuantumWorkbook",
  "Year" -> "2021", (* custom field *)
  "Version" -> "0.1.1",
  "WolframVersion" -> "12+",
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
      "MainPage" -> "Tutorials/Contents" }
   },
  "URL" -> "https://github.com/quantum-mob/QuantumWorkbook",
  "Category" -> "Education"
 ]
