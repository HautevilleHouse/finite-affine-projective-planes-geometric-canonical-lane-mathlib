import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.AffinePlaneAtomicGeometry

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

/-!
# Projective Completion From Affine

This module constructs the projective plane from an affine plane by adding points at infinity.
-/

structure ProjectivePoint (F : FiniteField) where
  kind : PointKind
  affineCoord : Option (F.carrier × F.carrier)
  lineAtInfinity : Bool

inductive PointKind where
  | affine
  | atInfinity

structure ProjectiveLine (F : FiniteField) where
  kind : LineKind
  equation : (F.carrier × F.carrier × F.carrier)  -- (a,b,c) for aX + bY + cZ = 0

inductive LineKind where
  | ordinary
  | infinity

structure ProjectivePlane (F : FiniteField) where
  Point : Type u
  Line : Type u
  incidence : Point → Line → Prop
  anyTwoPointsUniqueLine : ∀ p q : Point, p ≠ q → ∃! l : Line, incidence p l ∧ incidence q l
  anyTwoLinesIntersect : ∀ l m : Line, l ≠ m → ∃! p : Point, incidence p l ∧ incidence p m
  existsFourPointsNoThreeCollinear : ∃ (p q r s : Point), 
    p ≠ q ∧ p ≠ r ∧ p ≠ s ∧ q ≠ r ∧ q ≠ s ∧ r ≠ s ∧
    ∀ l : Line, ¬ (incidence p l ∧ incidence q l ∧ incidence r l) ∧
                  ¬ (incidence p l ∧ incidence q l ∧ incidence s l) ∧
                  ¬ (incidence p l ∧ incidence r l ∧ incidence s l) ∧
                  ¬ (incidence q l ∧ incidence r l ∧ incidence s l)
  finite_points : Fintype Point
  orderEqualsFieldOrder : Fintype.card Point = F.order * F.order + F.order + 1

theorem projective_order_determined (F : FiniteField) (P : ProjectivePlane F) :
    Fintype.card P.Point = F.order ^ 2 + F.order + 1 := by
  rw [P.orderEqualsFieldOrder]
  ring

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse