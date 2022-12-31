# A Quantum Playbook

This is a compilation of Mathematica(R) Notebook files containing demonstrations of various topics in quantum computing and information. It includes those that have been used to generate the demonstrations in ["A Quantum Computation Workbook" (Springer, March 2022)](https://link.springer.com/book/9783030912130). Users can try and modify the code themselves to build their own examples on the demonstrations and to experiment their fresh ideas.

The code in this compilation is based on Mathematica package [Q3](https://github.com/quantum-mob/Q3). [Q3](https://github.com/quantum-mob/Q3) consists of tools and utilities that perform symbolic calculations and numerical simulations useful in the study of quantum information processing, quantum many-body systems, and quantum spin systems. With [Q3](https://github.com/quantum-mob/Q3), one can avoid many of the tedious calculations involved in various principles and theorems of quantum theory. Furthermore, numerous visualization and simulation tools can help deepen the understanding of core concepts.

## Contents of the Quantum Workbook

[![Quantum Workbook Cover](Samples/BookCover.jpg?raw=true)](https://link.springer.com/book/9783030912130)

1. The Postulates of Quantum Mechanics
2. Quantum Computation: Overview ([Full text of Chapter 2 in PDF](./Samples/Chapter2.pdf))
3. Realizations of Quantum Computers
4. Quantum Algorithms
5. Quantum Decoherence
6. Quantum Error-Correction Codes
7. Quantum Information Theory
- Appendix A. Linear Algebra (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Appendix B. Superoperators (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Appendix C. Group Theory (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Appendix D. Mathematica Application Q3 (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Appendix E. Integrated Compilation of Demonstrations (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Appendix F. Solutions to Select Problems (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Bibliography (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- Index (available free of charge as Back Matter from the [Springer Link](https://link.springer.com/book/9783030912130))
- [Errata](./Samples/Errata.pdf)

NOTE: All back materials including appendices, bibliography, and index in a single PDF file are available free of charge from the [Springer Link](https://link.springer.com/book/9783030912130).

## Other Demonstrations

- Partial Trace: Physical Meaning
- Non-Unitary Dynamics of Quantum States
- Transposition as a Supermap
- Addition of Numbers
- Measurement of Total Pauli Z
- Entanglement Distillation
- Lambda-Matter in a Cavity
- Symmetry Effects on Quantum Master Equations
- Transmon: Quantum Phase Model
- And many others


## Requirements

QuantumPlaybook requires

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
  PacletInstall["QuantumPlaybook"]
 ]
```

Note that along with QuantumPlaybook, it also installs the main application Q3 for your convenience.


## Update

At the momoment, the contents of this package are being actively generated and modified, and you may want to check for updates from time to time:

```Mathematica
QuantumPlaybookCheckUpdate[]
```

In case there is an update, you can install it by using the following function:

```Mathematica
QuantumPlaybookUpdate[]
```

## How to use

Once QuantumPlaybook is installed, put `QuantumPlaybook` in the search field of the Wolfram Documentation Center (Mathematica Help window). You will see the table of contents of the workbook.

## Uninstall

If you do not want to use QuantumPlaybook any longer, just evaluate the following code:

```Mathematica
PacletUninstall["QuantumPlaybook"]
```
