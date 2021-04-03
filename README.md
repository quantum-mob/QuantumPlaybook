# QuantumWorkbook

This repository provides the workbook chapters in the format of Mathematica(R) Notebook.


## Installation

Copy the following code, and just evaluate it in your Mathematica(R) Notebook:

```Mathematica
Module[
  { ps },
  ps = PacletSiteRegister[
    "https://github.com/quantum-mob/PacletServer/raw/main",
    "Quamtum Mob Paclet Server"
   ];
  PacletSiteUpdate[ps];
  PacletInstall["QuantumWorkbook"]
 ]
```


## Update

Just call the following function:

```Mathematica
PacletInstall["QuantumWorkbook"]
```
It will automatically install a newer edition (if any) of the workbook.

To check for updates explicitly, evaluate the following code in your Mathematica Notebook

```Mathematica
PacletFindRemote["QuantumWorkbook"]
```
and compare the paclet version with the ones that have already been installed

```Mathematica
PacletFind["QuantumWorkbook"]
```


## How to use

Once QuantumWorkbook is installed, put `QuantumWorkbook` in the search field of the Wolfram Documentation Center (Mathematica Help window). You will see the table of contents of the workbook.
