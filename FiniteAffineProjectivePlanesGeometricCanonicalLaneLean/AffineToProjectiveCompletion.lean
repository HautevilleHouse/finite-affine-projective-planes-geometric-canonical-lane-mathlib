import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.ProjectivePlaneAxioms

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure AffinePlane (P : List Point) (L : List Line) where
  points : P
  lines : L
  incidence : Point → Line → Prop
  anyTwoPointsUniqueLine : ∀ p q : P, (p ≠ q) → ∃! l : L, incidence p l ∧ incidence q l
  parallelPostulate : ∀ p : P, ∀ l : L, ¬ incidence p l → ∃! m : L, incidence p m ∧ (∀ q : P, incidence q l → ¬ incidence q m)

structure ProjectiveCompletion (P : List Point) (L : List Line) where
  projectiveAxioms : ProjectivePlaneAxioms P L
  affinePlane : AffinePlane P L
  completionMap : Point → Point
  completionMapInjective : Function.Injective completionMap

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse