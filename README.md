# QuantumWorkbook

This repository provides the workbook chapters in the format of Mathematica(R) Notebook.


## Installation

Copy the following code, and just evaluate it in your Mathematica(R) Notebook.

```Mathematica
Module[
  { ps },
  ps = PacletSiteRegister[
    "https://github.com/quantum-mob/PacletServer/raw/main",
    "Quamtum Mob Paclet Server"
   ];
  PacletSiteUpdate[ps]
 ]
```

## How to use

Once QuantumWorkbook is installed, put `QuantumWorkbook` in the search field of the Wolfram Documentation Center (Mathematica Help window). You will see the table of contents of the workbook.
