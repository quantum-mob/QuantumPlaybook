# QuantumWorkbook

A compilation of the Mathematica(R) Notebook files that have been used to generate the demonstrations in ["A Quantum Computation Workbook"](https://link.springer.com/book/9783030912130) to be published with Springer on Febrauary 1, 2022 (ISBN: 978-3-030-91213-0, 978-3-030-91214-7). Users can try and modify the code themselves to build their own examples on the demonstrations and to experiment their fresh ideas.

## Requirement

QuantumWorkbook requires

* [Mathematica v12.1 or later](https://www.wolfram.com/mathematica)
* [Q3 Application](https://github.com/quantum-mob/Q3App)

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
  PacletInstall["Q3"];
  PacletInstall["QuantumWorkbook"]
 ]
```

Note that along with QuantumWorkbook, it also installs the main application Q3 for your convenience.


## Update

At the momoment, the contents of this package are being actively generated and modified, and you may want to check for updates from time to time:

```Mathematica
QuantumWorkbookCheckUpdate[]
```

In case there is an update, you can install it by using the following function:

```Mathematica
QuantumWorkbookUpdate[]
```

## How to use

Once QuantumWorkbook is installed, put `QuantumWorkbook` in the search field of the Wolfram Documentation Center (Mathematica Help window). You will see the table of contents of the workbook.

## Uninstall

If you do not want to use QuantumWorkbook any longer, just evaluate the following code:

```Mathematica
PacletUninstall["QuantumWorkbook"]
```
