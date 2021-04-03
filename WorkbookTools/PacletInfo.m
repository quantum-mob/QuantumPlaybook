(* Paclet Info File *)

(* $Date: 2021-03-05 13:39:01+09 $ *)
(* $Revision: 1.2 $ *)

Paclet[
  Name -> "WorkbookTools",
  Version -> "1.0.0",
  WolframVersion -> "12+",
  Description -> "Packages for authoring the Quantum Computing Workbook.",
  Creator -> "Mahn-Soo Choi (Korea University)",
  Extensions -> {
    { "Kernel",
      Root -> ".",
      Context -> {"WorkbookTools`" },
      (* Context specifies the package context or list of contexts . Used by
         FindFile. Also causes documentation links to be added to usage
         messages when documentation is present. *)
     },
    { "FrontEnd",
      Prepend -> True }
    (* Enables subdirectories within the FrontEnd to be handled,
       e.g. FrontEnd/Palettes, FrontEnd/StyleSheets, FrontEnd/SystemResources,
       FrontEnd/TextResources. These items will be recognized by the Front
       End, e.g. palettes will show up in the Palettes menu. *)
   },
  Category -> "Authoring"
 ]


