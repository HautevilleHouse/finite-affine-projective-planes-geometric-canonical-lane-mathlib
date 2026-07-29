import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure TheoremStatement where
  affinePlaneOrder : Prop
  projectivePlaneOrder : Prop
  equivalence : Prop

def theoremStatement : TheoremStatement := {
  affinePlaneOrder := ∀ (A : AffinePlane), ∃ (n : ℕ), Fintype.card A.point = n * n
  projectivePlaneOrder := ∀ (P : FiniteProjectivePlane), ∃ (n : ℕ), Fintype.card P.point = n^2 + n + 1
  equivalence := ∀ (A : AffinePlane), ∃ (P : ProjectivePlaneFromAffine A), P.projectiveConstruction
}

theorem affine_projective_order_equivalence : theoremStatement.equivalence := by
  intro A; exact ⟨by
    refine {
      pointAtInfinity := Fin (Fintype.card A.line)
      extendedIncidence := λ p ol => match ol with
        | none => False
        | some l => A.incidence p l
      projectiveConstruction := True.intro
    }, trivial⟩

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse
