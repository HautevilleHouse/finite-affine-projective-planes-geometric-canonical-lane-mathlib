import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

/-!
# Affine Plane Atomic Geometry

This module defines the atomic geometric structure of an affine plane over a finite field.
-/

structure FiniteField where
  carrier : Type u
  characteristic : Nat
  order : Nat
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zero : carrier
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addComm : ∀ a b : carrier, add a b = add b a
  neg : carrier → carrier
  addNeg : ∀ a : carrier, add a (neg a) = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  one : carrier
  oneMul : ∀ a : carrier, mul one a = a
  mulOne : ∀ a : carrier, mul a one = a
  mulComm : ∀ a b : carrier, mul a b = mul b a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  zeroNeOne : zero ≠ one
  finite : Fintype carrier

structure AffinePlane (F : FiniteField) where
  Point : Type u
  Line : Type u
  incidence : Point → Line → Prop
  between : Point → Point → Point → Prop
  uniqueLine : ∀ p q : Point, p ≠ q → ∃! l : Line, incidence p l ∧ incidence q l
  parallel : Line → Line → Prop
  parallelEquivalence : ∀ l : Line, Equiv (fun m : Line => parallel l m)
  parallelAxiom : ∀ (p : Point) (l : Line), ∀ p' : Point, p' ≠ p → 
    (¬ incidence p l) → (∃! m : Line, incidence p m ∧ parallel l m) ∧ 
    ∀ m' : Line, (incidence p m' ∧ parallel l m') → m' = (some m)
  finite_points : Fintype Point

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse
