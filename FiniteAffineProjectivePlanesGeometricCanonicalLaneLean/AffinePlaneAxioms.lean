import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure AffinePlaneAxiomsPackage where
  pointType : Type u
  lineType : Type v
  incidence : pointType → lineType → Prop
  anyTwoPointsUniqueLine : ∀ (p q : pointType), p ≠ q → ∃! (l : lineType), incidence p l ∧ incidence q l
  parallelPostulate : ∀ (p : pointType) (l : lineType), ∃! (m : lineType), incidence p m ∧ (∀ (q : pointType), incidence q l ↔ ¬ incidence q m → False)
  atLeastTwoPoints : ∃ (p q : pointType), p ≠ q
  atLeastTwoLines : ∃ (l m : lineType), l ≠ m

structure AffinePlaneAxiomsEvidence (A : AffinePlaneAxiomsPackage) where
  anyTwoPointsUniqueLineClosed : A.anyTwoPointsUniqueLine
  parallelPostulateClosed : A.parallelPostulate
  atLeastTwoPointsClosed : A.atLeastTwoPoints
  atLeastTwoLinesClosed : A.atLeastTwoLines

def AffinePlaneAxiomsClosed (A : AffinePlaneAxiomsPackage) : Prop :=
  A.anyTwoPointsUniqueLine ∧ A.parallelPostulate ∧ A.atLeastTwoPoints ∧ A.atLeastTwoLines

theorem affine_plane_axioms_closed_from_evidence (A : AffinePlaneAxiomsPackage) (E : AffinePlaneAxiomsEvidence A) :
    AffinePlaneAxiomsClosed A := by
  exact And.intro E.anyTwoPointsUniqueLineClosed
    (And.intro E.parallelPostulateClosed
      (And.intro E.atLeastTwoPointsClosed E.atLeastTwoLinesClosed))

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse