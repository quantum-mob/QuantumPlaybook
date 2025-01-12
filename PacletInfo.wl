(* Paclet Info File *)

(* $Date: 2023-11-12 20:47:42+09 $ *)
(* $Revision: 1.70 $ *)

Paclet[
  "Name" -> "QuantumPlaybook",
  "Version" -> "3.3.23",
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
      "Root" -> "Assets/Samples",
      "Assets" -> {
        {"Front Matter", "FrontMatter.pdf"},
        {"Back Matter", "BackMatter.pdf"},
        {"Chapter 2", "Chapter2.pdf"},
        {"Errata", "Errata.pdf"}
      }
    },
    { "Asset",
      "Root" -> "Assets/Data",
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
