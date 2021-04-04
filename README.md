# QuantumWorkbook

The collection of Mathematica(R) Notebook files that have been used to generate the demonstation in the Quantum Workbook.

## Installation

Copy the following code, and just evaluate it in your Mathematica(R) Notebook:

```Mathematica
Module[
  { ps },
  ps = PacletSiteRegister[
    "https://github.com/quantum-mob/PacletServer/raw/main",
    "Quantum Mob Paclet Server"
   ];
  PacletSiteUpdate[ps];
  PacletInstall["WorkbookTools"]
  PacletInstall["QuantumWorkbook"]
 ]
```

Note that along with QuantumWorkbook, it also installs the unitility package WorkbookTools.


## Update

Just call the following function:

```Mathematica
PacletSiteUpdate["Quantum Mob Paclet Server"];
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
