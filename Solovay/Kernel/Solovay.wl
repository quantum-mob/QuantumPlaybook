(* -*- mode:math -*- *)
Get["Q3`"];
Q3Assert["2.8.4"];

BeginPackage["Solovay`", {"Q3`"}]

Unprotect["`*"];
ClearAll["`*"];

`Solovay`$Version = StringJoin[
  "Solovay/", $Input, " v",
  StringSplit["$Revision: 1.21 $"][[2]], " (",
  StringSplit["$Date: 2023-03-13 13:18:28+09 $"][[2]], ") ",
  "Mahn-Soo Choi"
 ];

{ GroupCommutator,
  BalancedCommutator };

{ Solovay, TheSolovay, SolovayDagger };

{ SolovayChains,
  SolovayKitaev };

Begin["`Private`"]

ClearAll["`*"];

GroupCommutator::usage = "GroupCommutator[a, b] returns the group commutator of a and b; that is, a**b**Inverse[a]**Inverse[b]."

GroupCommutator[a_?MatrixQ, b_?MatrixQ] :=
  Dot[a,  b, Topple @ a, Topple @ b]

GroupCommutator[a_?NonCommutativeQ, b_?NonCommutativeQ] :=
  Multiply[a, b, Inverse @ a, Inverse @ b]


BalancedCommutator::usage = "BalancedCommuator[u] returns the group commuator decomposition of 2 x 2 unitary matrix u; that is, a pair of two group elements a and b such that u = GroupCommutator[a, b]."

BalancedCommutator[mat_?SquareMatrixQ] := Module[
  { angle, axis, new, x, V, W, S },
  {angle, axis} = RotationSystem[mat];
  x = 2 * Sign[angle] * ArcSin[Sqrt @ Abs @ Sin[angle/4]];
  V = TheRotation[x, 3];
  W = TheRotation[x, 2];
  {angle, new} = RotationSystem[V . W . Topple[V] . Topple[W]];
  angle = ArcCos[new . axis];
  new = Cross[new, axis];
  S = TheRotation@{angle, new};
  {S . V . Topple[S], S . W . Topple[S]}
 ] /; Length[mat] == 2



Solovay::usage = "Solovay[k] represents the element associated with index k in the densely generating set {H, T, \!\(\*SuperscriptBox[\(T\),\(-1\)]\)}."

SetAttributes[Solovay, Listable];

Format @ Solovay[9] = Interpretation["H", Pauli[6]];

Format @ Solovay[1] = Interpretation["T", Pauli[8]];

Format @ Solovay[k_Integer?Negative] := Interpretation[
  Superscript["T", ToString @ k],
  MultiplyPower[Pauli[-3], -k]
 ]

Format @ Solovay[k_Integer] := Interpretation[
  Superscript["T", ToString @ k],
  MultiplyPower[Pauli[8], k]
 ]


TheSolovay::usage = "TheSolovay[k] returns the matrix representation of Solovay[k]."

SetAttributes[TheSolovay, Listable];

TheSolovay[9] = ThePauli[6];

TheSolovay[k_Integer] :=
  SparseArray[{{1, 1} -> 1, {2, 2} -> Exp[I*Pi*k/4]}, {2,2}]

TheSolovay @ Solovay[k_Integer] := TheSolovay[k]


SolovayDagger::usage = "SolovayDagger[k] returns the index corresponding to the Hermitian conjugate of Solovay[k]."

SetAttributes[SolovayDagger, Listable]

SolovayDagger[9] = 9;
SolovayDagger[k_Integer] = -k;


SolovayKitaev::usage = "SolovayKitae[u, n] constructs at the n'th recursive level a sequence seq of elementary generators that approximately reconstruct matrix u, and returns the pair {seq, mat} with matrix mat corresponding to the sequence seq."

SolovayKitaev::init = "Generating the initial approximately covering set; it may take a while."

Options[SolovayKitaev] = {
  "InitialLength" -> 18
 }

$dictionary = {};

SolovayKitaev[u_?SquareMatrixQ, n_Integer, opts:OptionsPattern[]] := Module[
  { uu, vv, ww,
    mu, mv, mw },
  {uu, mu} = SolovayKitaev[u, n-1, opts];
  {mv, mw} = BalancedCommutator[u . Topple[mu]];
  {vv, mv} = SolovayKitaev[mv, n-1, opts];
  {ww, mw} = SolovayKitaev[mw, n-1, opts];
  { Join[vv, ww, Reverse[SolovayDagger @ vv], Reverse[SolovayDagger @ ww], uu],
    Dot[mv, mw, Topple @ mv, Topple @ mw, mu] }
 ]

SolovayKitaev[u_?SquareMatrixQ, 0, OptionsPattern[]] := Module[
  { kk },
  If[ $dictionary == {},
    PrintTemporary["Initializing the dictionary... It may take a while."];
    EchoTiming[$dictionary = svyDictionary[OptionValue @ "InitialLength"]]
   ];
  kk = Keys @ MinimalBy[$dictionary, Norm[#-u]&];
  kk = Flatten @ MinimalBy[kk, Length, 1];
  {kk, $dictionary[kk]}
 ]


svyDictionary::usage = "..."

svyDictionary[n_Integer] := Module[
  { cc, mm },
  cc = Catenate @ SolovayChains @ Range[n];
  mm = Dot @@@ N[TheSolovay @ cc];
  AssociationThread[cc -> mm]
 ]


SolovayChains::usage = "SolovayChains[n] returns the list of all possible generator sequences of length n."

SetAttributes[SolovayChains, Listable];

SolovayChains[n_Integer] := Join[
  SolovayChains[n, 0],
  SolovayChains[n, 1],
  SolovayChains[n, 2]
 ]

SolovayChains[n_Integer, 0] := Module[
  { cc },
  cc = Catenate @ Table[IntegerPartitions[n+1-k, {k}, {1,2,3,4}], {k, 1, n}];
  cc = Catenate @ Map[
    Tuples,
    cc /. {1 -> {-1,1}, 2 -> {-2,2}, 3 -> {-3,3}, 4 -> {4}}
   ];
  Map[Riffle[#, 9]&, cc]
 ]

SolovayChains[n_Integer, 1] := With[
  { cc = SolovayChains[n-1, 0] },
  Join[Map[Prepend[#, 9]&, cc], Map[Append[#, 9]&, cc]]
 ]

SolovayChains[n_Integer, 2] := With[
  { cc = SolovayChains[n-2, 0] },
  Map[Join[{9}, #, {9}]&, cc]
 ]


SetAttributes[Evaluate @ Names["`*"], ReadProtected];

End[]

SetAttributes[Evaluate @ Protect["`*"], ReadProtected];

EndPackage[]
