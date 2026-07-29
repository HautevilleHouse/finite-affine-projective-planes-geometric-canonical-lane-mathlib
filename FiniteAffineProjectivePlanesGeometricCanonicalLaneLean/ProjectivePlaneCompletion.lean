import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure ProjectivePlaneCompletionPackage (A : AffinePlaneAxiomsPackage) where
  pointType : Type u
  lineType : Type v
  incidence : pointType → lineType → Prop
  affineEmbedding : A.pointType → pointType
  lineAtInfinity : lineType
  pointsAtInfinity : pointType → Prop
  eachParallelClassUniquePointAtInfinity : ∀ (l : A.lineType), ∃! (p : pointType), pointsAtInfinity p ∧ incidence p lineAtInfinity ∧ (∀ (q : A.pointType), A.incidence q l → incidence (affineEmbedding q) lineAtInfinity)
  eachPointAtInfinityFromParallelClass : ∀ (p : pointType), pointsAtInfinity p → ∃ (l : A.lineType), ∀ (q : A.pointType), A.incidence q l ↔ incidence (affineEmbedding q) lineAtInfinity
  allPointsCovered : ∀ (p : pointType), (∃ (q : A.pointType), affineEmbedding q = p) ∨ pointsAtInfinity p

structure ProjectivePlaneCompletionEvidence {A : AffinePlaneAxiomsPackage} (P : ProjectivePlaneCompletionPackage A) where
  affineEmbeddingInjective : Function.Injective P.affineEmbedding
  eachParallelClassUniquePointAtInfinityClosed : P.eachParallelClassUniquePointAtInfinity
  eachPointAtInfinityFromParallelClassClosed : P.eachPointAtInfinityFromParallelClass
  allPointsCoveredClosed : P.allPointsCovered

def ProjectivePlaneCompletionClosed {A : AffinePlaneAxiomsPackage} (P : ProjectivePlaneCompletionPackage A) : Prop :=
  P.eachParallelClassUniquePointAtInfinity ∧ P.eachPointAtInfinityFromParallelClass ∧ P.allPointsCovered

theorem projective_plane_completion_closed_from_evidence {A : AffinePlaneAxiomsPackage} (P : ProjectivePlaneCompletionPackage A) (E : ProjectivePlaneCompletionEvidence P) :
    ProjectivePlaneCompletionClosed P := by
  exact And.intro E.eachParallelClassUniquePointAtInfinityClosed
    (And.intro E.eachPointAtInfinityFromParallelClassClosed E.allPointsCoveredClosed)

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse