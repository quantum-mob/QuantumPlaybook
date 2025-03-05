(* -*- mode:math -*- *)
Get["QuantumMob`Q3`"];
Q3Assure["4.1.0"];

BeginPackage["QuantumMob`Transmon`", {"QuantumMob`Q3`"}]

Unprotect["`*"];
ClearAll["`*"];

{ BlochEnergy,
  BlochFunction,
  BlochHamiltonian };

{ TransmonEnergy,
  TransmonFunction,
  TransmonExponent,
  TransmonHamiltonian };

Begin["`Private`"]

ClearAll["`*"];

BlochEnergy::usage = "BlochEnergy[\[Nu], \[Alpha]] returns the energy of the Bloch function with characteristic exponent \[Nu] for the transmon Hamiltonian with MacCumber parameter \[Alpha]."

BlochEnergy[nu_, alpha_] := (
  1/alpha + (alpha/8) * MathieuCharacteristicB[2*nu, -4/alpha^2]
) /; OddQ @ Rationalize[2*nu]

BlochEnergy[nu_, alpha_] := (
  1/alpha + (alpha/8) * MathieuCharacteristicA[2*nu, -4/alpha^2]
)


BlochFunction::usage = "BlochFunction[\[Nu], \[Alpha]] represents the Bloch function with characteristic exponent (or quasi-momentum) \[Nu] for the transmon Hamilonian with MacCumber parameter \[Alpha]."

BlochFunction[nu_, alpha_][x_] := BlochFunction[nu, alpha, x]

BlochFunction[nu_, alpha_, x_] := Module[
  { a, b, q = -4/alpha^2 },
  a = MathieuCharacteristicA[2*nu, q];
  MathieuC[a, q, x/2] + I*MathieuS[a, q, x/2]
]


BlochHamiltonian::usage = "BlochHamiltonian[\[Alpha], x] represents the Bloch Hamiltonian in the x-space representation for MacCumber parameter \[Alpha].\nBlochHamiltonian[\[Alpha], x][expr] operates the operator on expr."

BlochHamiltonian[alpha_, x_][expr_] :=
  -(alpha/2)*D[expr,{x,2}] + (1 - Cos[x])*expr/alpha


(**** <TransmonExponent> ****)

TransmonExponent::usage = "TransmonExponent[n, q] returns the characteristic exponent of the n-th excited state of the transmon Hamiltonian for dimensionless gate charge q, with n=0 referring to the ground state."

TransmonExponent[n_Integer?NonNegative] := TransmonExponent[n, 0]

TransmonExponent[n_Integer?EvenQ, q_] := (n/2) /; Chop[q] == 0

TransmonExponent[n_Integer?OddQ, q_] := ((n+1)/2) /; Chop[q] == 0

TransmonExponent[n_Integer?EvenQ, q_] :=
  ((n+1)/2) /; Rationalize[q] == 1/2

TransmonExponent[n_Integer?OddQ, q_] :=
  (n/2) /; Rationalize[q] == 1/2

TransmonExponent[n_Integer?NonNegative, q_] := With[
  { fraction = Mod[q, 1, -1/2] },
  Sign[fraction] * Power[-1, n+1] * Ceiling[n/2] - fraction
 ]

(**** </TransmonExponent> ****)


(**** <TransmonEnergy> ****)

(* H = 4 E_C (n-q)^2 - E_J cos(\phi), E_C := e^2/2C *)
(* MacCumber parameter: \alpha:=\sqrt{8E_C/E_J} *)
(* Energies are measured in units of \sqrt{8E_CE_J}=\alpha E_J *)

TransmonEnergy::usage = "TransmonEnergy[n, \[Alpha], q] returns the dimensionless energy of the n-th excited state of the dimensionless transmon Hamiltonian for MacCumber parameter \[Alpha] and dimensionless gate charge q, with n=0 referring to the ground state."

TransmonEnergy[n_Integer?EvenQ, alpha_, q_] := With[
  { nu = TransmonExponent[n, q] },
  1/alpha + (alpha/8) * MathieuCharacteristicA[2*nu, -4/alpha^2]
 ] /; IntegerQ @ Rationalize[2*q]

TransmonEnergy[n_Integer?OddQ, alpha_, q_] := With[
  { nu = TransmonExponent[n, q] },
  1/alpha + (alpha/8) * MathieuCharacteristicB[2*nu, -4/alpha^2]
 ] /; IntegerQ @ Rationalize[2*q]


TransmonEnergy[n_Integer, alpha_, q_] :=
  BlochEnergy[TransmonExponent[n, q], alpha]

(**** </TransmonEnergy> ****)


(**** <TransmonFunction> ****)

TransmonFunction::usage = "TransmonFunction[n, \[Alpha], q] represents the wave function of the n-th excited state of the dimensionless transmon Hamiltonian for MacCumber parameter \[Alpha] and dimensionless gate charge q, with n=0 referring to the ground state.\nTransmonFunction[n, \[Alpha], q, x] or TransmonFunction[n, \[Alpha], q][x] returns the value of the wave function at x."

TransmonFunction[n_Integer?NonNegative, alpha_, q_][x_] :=
  TransmonFunction[n, alpha, q, x]


TransmonFunction[n_Integer?EvenQ, alpha_, q_, x_] := With[
  { mq = -4/alpha^2,
    nu = TransmonExponent[n, q] },
  MathieuC[MathieuCharacteristicA[2*nu, mq], mq, x/2]
 ] /; IntegerQ @ Rationalize[2*q]

TransmonFunction[n_Integer?OddQ, alpha_, q_, x_] := With[
  { mq = -4/alpha^2,
    nu = TransmonExponent[n, q] },
  MathieuS[MathieuCharacteristicB[2*nu, mq], mq, x/2]
 ] /; IntegerQ @ Rationalize[2*q]


TransmonFunction[n_Integer?NonNegative, alpha_, q_, x_] :=
  Exp[I*q*x] * BlochFunction[TransmonExponent[n, q], alpha, x]

(**** </TransmonFunction> ****)


TransmonHamiltonian::usage = "TransmonHamiltonian[\[Alpha], q, x] represents the transmon Hamiltonian in the x-space representation for MacCumber parameter \[Alpha] and dimensionless gate charge q.\nTransmonHamiltonian[\[Alpha],x] is equivalent to TransmonHamiltonia[\[Alpha],0,x].\nTransmonHamiltonian[\[Alpha], q, x][expr] or TransmonHamiltonian[\[Alpha], x][expr] operates the operator on expr."

TransmonHamiltonian[alpha_, x_][expr_] :=
  -(alpha/2)*D[expr,{x,2}] + (1 - Cos[x])*expr/alpha

TransmonHamiltonian[alpha_, q_, x_][expr_] :=
  (alpha/2)*(hatP[x,q] @ hatP[x,q] @ expr) + (1 - Cos[x])*expr/alpha


hatP::usage = "hatP[x, q][expr] operates the gauge-invariant momentum operator in the x-space representation for dimensionless gate charge q."

hatP[x_][expr_] := -I*D[expr, x]

hatP[x_, q_][expr_] := -I*D[expr, x] - q*expr


SetAttributes[Evaluate @ Names["`*"], ReadProtected];

End[]

SetAttributes[Evaluate @ Protect["`*"], ReadProtected];

EndPackage[]
