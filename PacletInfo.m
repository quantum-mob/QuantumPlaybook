(* Paclet Info File *)

(* $Date: 2021-04-04 01:54:53+09 $ *)
(* $Revision: 1.2 $ *)

Paclet[
  Name -> "QuantumWorkbook",
  Version -> "1.1.0",
  WolframVersion -> "12+",
  Description -> "Mathematica Notebook files accompanying the Quantum Computation Workbook.",
  Creator -> "Mahn-Soo Choi (Korea University)",
  Extensions -> {
    { "Kernel",
      Root -> "Kernel",
      Context -> { "QuantumWorkbook" }
      (* Context specifies the package context or list of contexts . Used by
         FindFile. Also causes documentation links to be added to usage
         messages when documentation is present. *)
     },
    { "Documentation",
      Language -> "English",
      MainPage -> "Tutorials/Contents" }
   },
  Updating -> Automatic,
  Category -> "Workbook"
 ]
