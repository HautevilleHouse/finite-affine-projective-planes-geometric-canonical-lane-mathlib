import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure AnalyticCertificate (P : FiniteProjectivePlane) where
  order : ℕ
  orderCorrect : Fintype.card P.point = order^2 + order + 1
  fanoAxiom : order ≠ 2 → ∃ (a b c d : P.point), ∃ (l1 l2 l3 : P.line), (∀ p, P.incidence p l1 → p = a ∨ p = b ∨ p = c) ∧ (∀ p, P.incidence p l2 → p = a ∨ p = d ∨ p = b) ∧ (∀ p, P.incidence p l3 → p = a ∨ p = c ∨ p = d)

def AnalyticCertificateClosed (P : FiniteProjectivePlane) : Prop :=
  Nonempty (AnalyticCertificate P)

theorem analytic_certificate_closed (P : FiniteProjectivePlane) (h : P.projective) : AnalyticCertificateClosed P := by
  refine ⟨?_, ?_⟩
  · exact Classical.choice (Fintype.card P.point).toNat
  · have hcard : Fintype.card P.point = (Classical.choice (Fintype.card P.point).toNat)^2 + (Classical.choice (Fintype.card P.point).toNat) + 1 := by
      simp
    exact hcard

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse