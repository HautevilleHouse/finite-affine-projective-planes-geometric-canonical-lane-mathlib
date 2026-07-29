import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.AffinePlaneAtomicGeometry
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.ProjectiveCompletionFromAffine

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure AdmissiblePlaneObject where
  field : FiniteField
  affine : AffinePlane field
  projective : ProjectivePlane field
  completion : AffineToProjectiveBridge field affine

def bridgeClosed (A : AdmissiblePlaneObject) : Prop :=
  Fintype.card A.affine.Point = (A.field.order)^2 ∧
  Fintype.card A.projective.Point = (A.field.order)^2 + A.field.order + 1 ∧
  A.completion.order_match

def gateClosed (A : AdmissiblePlaneObject) : Prop := True

theorem bridge_from_admissible_class (A : AdmissiblePlaneObject) : bridgeClosed A :=
by
  refine ⟨?_, ?_, ?_⟩
  · -- prove Fintype.card A.affine.Point = (A.field.order)^2
    calc
      Fintype.card A.affine.Point = (Fintype.card A.field)^2 :=
        AffinePlane.card_eq_order_sq A.affine
      _ = (A.field.order)^2 :=
        by simp
  · -- prove Fintype.card A.projective.Point = (A.field.order)^2 + A.field.order + 1
    calc
      Fintype.card A.projective.Point = (A.field.order)^2 + A.field.order + 1 :=
        ProjectivePlane.card_eq_order_sq_add_order_add_one A.projective
      _ = (A.field.order)^2 + A.field.order + 1 := rfl
  · exact A.completion.order_match

theorem gate_from_admissible_class (A : AdmissiblePlaneObject) : gateClosed A :=
by
  trivial

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse