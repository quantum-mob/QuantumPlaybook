# Installation Guide

One can install the QuantumPlaybook package using the `paclet` system that has recently beeen introduced by Wolfram Research.

## Requirements

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

## Uninstall

If you do not want to use QuantumPlaybook any longer, just evaluate the following code:

```Mathematica
PacletUninstall["QuantumPlaybook"]
```
