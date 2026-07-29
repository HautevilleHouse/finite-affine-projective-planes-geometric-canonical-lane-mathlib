import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.AffinePlane

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure ProjectiveCompletionPackage (A : AffinePlanePackage) where
  pointsAtInfinity : Type w
  projectivePoints : Type x
  completionAxioms : Prop
  finiteOrder : ℕ

structure ProjectiveCompletionEvidence (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A) where
  completionAxiomsClosed : P.completionAxioms

def ProjectiveCompletionClosed (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A) : Prop :=
  P.completionAxioms ∧ P.finiteOrder = A.finiteCardinal + 1

theorem projective_completion_closed_from_evidence (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A)
    (E : ProjectiveCompletionEvidence A P) : ProjectiveCompletionClosed A P := by
  exact And.intro E.completionAxiomsClosed rfl

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse