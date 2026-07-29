import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure Point where
  label : String

defining point type

structure Line where
  label : String
  points : List Point

defining line type

structure Incidence where
  point : Point
  line : Line
  on : Prop

structure ProjectivePlaneAxioms (P : List Point) (L : List Line) where
  anyTwoPointsUniqueLine : ∀ p q : P, (p ≠ q) → ∃! l : L, (Incidence p l ∧ Incidence q l)
  anyTwoLinesUniquePoint : ∀ l m : L, (l ≠ m) → ∃! p : P, (Incidence p l ∧ Incidence p m)
  atLeastFourPoints : ∃ (p q r s : P), p ≠ q ∧ p ≠ r ∧ p ≠ s ∧ q ≠ r ∧ q ≠ s ∧ r ≠ s
  atLeastThreeLines : ∃ (l m n : L), l ≠ m ∧ l ≠ n ∧ m ≠ n
  nonDegenerate : ∀ p : P, ∃ l : L, Incidence p l

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse