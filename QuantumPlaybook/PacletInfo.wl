(* ::Package:: *)

PacletObject[
  <|
    "Name" -> "QuantumMob/QuantumPlaybook",
    "Description" -> "Three compilations of demonstrations in quantum physics",
    "Creator" -> "Mahn-Soo Choi",
    "URL" -> "https://github.com/quantum-mob/QuantumPlaybook",
    "License" -> "MIT",
    "PublisherID" -> "QuantumMob",
    "Version" -> "4.1.5",
    "WolframVersion" -> "13+",
    "PrimaryContext" -> "QuantumMob`QuantumPlaybook`",
    "Category" -> "Education",
    "Extensions" -> {
      {
        "Kernel",
        "Root" -> "Kernel",
        "Context" -> {
          "QuantumMob`QuantumPlaybook`",
          "QuantumMob`QuantumPlaybook`Custom`"
        },
        (* "HiddenImport" -> True, *)
        "Symbols" -> {
          "QuantumMob`QuantumPlaybook`QuantumPlaybookCheckUpdate",
          "QuantumMob`QuantumPlaybook`QuantumPlaybookEdition",
          "QuantumMob`QuantumPlaybook`QuantumPlaybookUpdate"
        }
      },
      {
        "Kernel",
        "Root" -> "Transmon/Kernel",
        "Context" -> "QuantumMob`Transmon`",
        (* "HiddenImport" -> True, *)
        "Symbols" -> {
          "QuantumMob`Transmon`BlochEnergy",
          "QuantumMob`Transmon`BlochFunction",
          "QuantumMob`Transmon`TransmonEnergy",
          "QuantumMob`Transmon`TransmonExponent",
          "QuantumMob`Transmon`TransmonFunction",
          "QuantumMob`Transmon`TransmonHamiltonian"
        }
      },
      {
        "Kernel",
        "Root" -> "Solovay/Kernel",
        "Context" -> "QuantumMob`Solovay`",
        (* "HiddenImport" -> True, *)
        "Symbols" -> {
          "QuantumMob`Solovay`GroupCommutator",
          "QuantumMob`Solovay`BalancedCommutator",
          "QuantumMob`Solovay`Solovay",
          "QuantumMob`Solovay`SolovayChains",
          "QuantumMob`Solovay`SolovayKitaev"
        }
      },
      {
        "Documentation",
        "Language" -> "English",
        "MainPage" -> "Tutorials/QuantumPlaybook",
        "Resources" -> {
          "Workbook/Algorithms.nb",
          "Workbook/Computation.nb",
          "Workbook/Computers.nb",
          "Workbook/Decoherence.nb",
          "Workbook/Errors.nb",
          "Workbook/GroupTheory.nb",
          "Workbook/Information.nb",
          "Workbook/LinearAlgebra.nb",
          "Workbook/Postulates.nb",
          "Workbook/Solutions.nb",
          "Workbook/Superoperators.nb"
        }
      },
      {
        "Asset",
        "Root" -> "Asset/Samples",
        "Assets" -> {
          {"Front Matter", "FrontMatter.pdf"},
          {"Back Matter", "BackMatter.pdf"},
          {"Chapter 2", "Chapter2.pdf"},
          {"Errata", "Errata.pdf"}
        }
      },
      {
        "Asset",
        "Root" -> "Asset/Data",
        "Assets" -> {{"Iris", "QML/Iris-Class1and2-Scaled.txt"}}
      }
    },
    "Loading" -> "Automatic",
    "Updating" -> "Automatic",
    "Year" -> "2022"
  |>
]
