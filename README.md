# QuantumWorkbook

A compilation of the Mathematica(R) Notebook files that have been used to generate the demonstrations in ["A Quantum Computation Workbook" (Springer, March 2022)](https://link.springer.com/book/9783030912130). Users can try and modify the code themselves to build their own examples on the demonstrations and to experiment their fresh ideas.

The code in this compilation is based on Mathematica package [Q3](https://github.com/quantum-mob/Q3). [Q3](https://github.com/quantum-mob/Q3) consists of tools and utilities that perform symbolic calculations and numerical simulations useful in the study of quantum information processing, quantum many-body systems, and quantum spin systems. With [Q3](https://github.com/quantum-mob/Q3), one can avoid many of the tedious calculations involved in various principles and theorems of quantum theory. Furthermore, numerous visualization and simulation tools can help deepen the understanding of core concepts.

## Contents of the Workbook

![Quantum Workbook Cover](Samples/BookCover.jpg?raw=true)

1. The Postulates of Quantum Mechanics
2. Quantum Computation: Overview ([Full text of Chapter 2 in PDF](./Samples/Chapter2.pdf))
3. Realizations of Quantum Computers
4. Quantum Algorithms
5. Quantum Decoherence
6. Quantum Error-Correction Codes
7. Quantum Information Theory
- Appendix A. Linear Algebra
- Appendix B. Superoperators
- Appendix C. Group Theory
- Appendix D. Mathematica Application Q3
- Appendix E. Integrated Compilation of Demonstrations
- Appendix F. Solutions to Select Problems
- Bibliography
- Index

## Requirements

QuantumWorkbook requires

* [Mathematica v12.2 or later](https://www.wolfram.com/mathematica)
* [Q3 Application](https://github.com/quantum-mob/Q3)

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
