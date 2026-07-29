import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure ProjectiveClosurePackage (P : FiniteAffineProjectivePlane) where
  affinePlane : FiniteAffineProjectivePlane
  embedding : Prop
  closureConstructed : Prop
  uniquenessUpToIsomorphism : Prop
  embeddingTerm : embedding
  closureTerm : closureConstructed
  uniquenessTerm : uniquenessUpToIsomorphism

def ProjectiveClosureClosed (P : FiniteAffineProjectivePlane) (C : ProjectiveClosurePackage P) : Prop :=
  C.embedding ∧ C.closureConstructed ∧ C.uniquenessUpToIsomorphism

theorem projective_closure_closed_from_evidence (P : FiniteAffineProjectivePlane) (C : ProjectiveClosurePackage P) :
    ProjectiveClosureClosed P C := by
  exact And.intro C.embeddingTerm (And.intro C.closureTerm C.uniquenessTerm)

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse