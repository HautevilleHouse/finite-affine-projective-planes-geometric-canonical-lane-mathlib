import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure IncidenceEvidence (A : AffinePlane) where
  twoPointsDetermineLine : ∀ (p q : A.point), p ≠ q → ∃! l : A.line, A.incidence p l ∧ A.incidence q l
  twoLinesIntersectAtOnePoint : ∀ (l m : A.line), l ≠ m → ∃! p : A.point, A.incidence p l ∧ A.incidence p m
  parallelPostulate : ∀ (l : A.line) (p : A.point), ¬ A.incidence p l → ∃! m : A.line, A.incidence p m ∧ (∀ q : A.point, A.incidence q l → ¬ A.incidence q m)

def IncidenceEvidenceClosed (A : AffinePlane) : Prop :=
  Nonempty (IncidenceEvidence A)

theorem incidence_evidence_from_affine (A : AffinePlane) (h : A.affine) : IncidenceEvidenceClosed A := by
  unfold IncidenceEvidenceClosed
  refine ⟨?_, ?_, ?_⟩
  · exact A.twoPointsDetermineLine
  · exact A.twoLinesIntersectAtOnePoint
  · exact A.parallelPostulate

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse