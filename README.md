# QuantumWorkbook

A compilation of the Mathematica(R) Notebook files that have been used to generate the demonstrations in the Quantum Workbook.

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
  PacletInstall["WorkbookTools"];
  PacletInstall["QuantumWorkbook"]
 ]
```

Note that along with QuantumWorkbook, it also installs the unitility package WorkbookTools.


## Update

The contents of this package is actively updated, and you may want to check for the updates.frequently.

Fortunately, once installed, QuantumWorkbook will automatically check for updates and install the newest update whenever it is available.

If you want to check for updates manually, use the following code:

```Mathematica
<< QuantumWorkbook`
QuantumWorkbookCheckUpdate[]
QuantumWorkbookUpdate[]
```

or

```Mathematica
PacletSiteUpdate["Quantum Mob Paclet Server"];
PacletInstall["QuantumWorkbook"]
```

It will automatically install a newest edition (if any) of the workbook.


## How to use

Once QuantumWorkbook is installed, put `QuantumWorkbook` in the search field of the Wolfram Documentation Center (Mathematica Help window). You will see the table of contents of the workbook.

## Uninstall

If you do not want to use QuantumWorkbook any longer, just evaluate the following code:

```Mathematica
PacletUninstall["WorkbookTools"];
PacletUninstall["QuantumWorkbook"]
```
