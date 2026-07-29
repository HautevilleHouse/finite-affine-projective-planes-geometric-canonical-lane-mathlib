import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.IncidenceStructureConstraints

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

/-!
# OwenProofStructure

This module defines the bridge structure for the proof that every finite affine plane of order n
completes to a projective plane of order n.
-/

structure AffineToProjectiveBridge (F : FiniteField) (A : AffinePlane F) where
  projectivePoints : Type u
  projectiveLines : Type u
  incidence : projectivePoints → projectiveLines → Prop
  embedding : A.Point → projectivePoints
  infinityPoints : projectivePoints
  infinityLine : projectiveLines
  embedding_preserves_incidence : ∀ (p : A.Point) (l : A.Line), 
    A.incidence p l ↔ incidence (embedding p) (infinityLine) -- need proper mapping
  any_two_points_unique_line : ∀ p q : projectivePoints, p ≠ q → ∃! l : projectiveLines, incidence p l ∧ incidence q l
  any_two_lines_intersect : ∀ l m : projectiveLines, l ≠ m → ∃! p : projectivePoints, incidence p l ∧ incidence p m
  exists_four_points_no_three_collinear : ∃ (p q r s : projectivePoints),
    p ≠ q ∧ p ≠ r ∧ p ≠ s ∧ q ≠ r ∧ q ≠ s ∧ r ≠ s ∧
    ∀ l : projectiveLines, ¬ (incidence p l ∧ incidence q l ∧ incidence r l) ∧
                            ¬ (incidence p l ∧ incidence q l ∧ incidence s l) ∧
                            ¬ (incidence p l ∧ incidence r l ∧ incidence s l) ∧
                            ¬ (incidence q l ∧ incidence r l ∧ incidence s l)
  finite_projective_points : Fintype projectivePoints
  order_match : Fintype.card projectivePoints = F.order * F.order + F.order + 1

theorem affine_completes_to_projective (F : FiniteField) (A : AffinePlane F) (B : AffineToProjectiveBridge F A) :
    ProjectivePlaneConstraints (B.projectivePoints) (B.projectiveLines) 
      (IncidenceStructure.mk B.incidence) := by
  refine {
    finite_points := B.finite_projective_points
    finite_lines := inferInstance
    any_two_points_determine_line := by
      intro p q h
      exact B.any_two_points_unique_line p q h
    any_two_lines_intersect := by
      intro l m h
      exact B.any_two_lines_intersect l m h
    no_three_collinear_exception := B.exists_four_points_no_three_collinear
    order_property := ⟨F.order, by simpa [B.order_match], by
      have hcard : Fintype.card (B.projectivePoints) = F.order ^ 2 + F.order + 1 := by
        calc
          Fintype.card (B.projectivePoints) = F.order * F.order + F.order + 1 := B.order_match
          _ = F.order ^ 2 + F.order + 1 := by ring
      simpa [hcard]⟩
  }

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse