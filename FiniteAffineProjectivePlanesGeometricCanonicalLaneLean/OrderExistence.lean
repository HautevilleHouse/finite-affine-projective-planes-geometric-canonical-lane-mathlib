import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure OrderExistencePackage (A : AffinePlaneAxiomsPackage) where
  order : ℕ
  orderIsPrimePower : ∃ (p : ℕ) (k : ℕ), Nat.Prime p ∧ order = p ^ k
  linesPerPoint : ℕ
  pointsPerLine : ℕ
  totalPoints : ℕ
  totalLines : ℕ
  linesPerPointEqOrderPlusOne : linesPerPoint = order + 1
  pointsPerLineEqOrderPlusOne : pointsPerLine = order + 1
  totalPointsEqOrderSq : totalPoints = order * order
  totalLinesEqOrderSqPlusOrderPlusOne : totalLines = order * order + order + 1

structure OrderExistenceEvidence {A : AffinePlaneAxiomsPackage} (O : OrderExistencePackage A) where
  orderIsPrimePowerClosed : O.orderIsPrimePower
  linesPerPointEqOrderPlusOneClosed : O.linesPerPointEqOrderPlusOne
  pointsPerLineEqOrderPlusOneClosed : O.pointsPerLineEqOrderPlusOne
  totalPointsEqOrderSqClosed : O.totalPointsEqOrderSq
  totalLinesEqOrderSqPlusOrderPlusOneClosed : O.totalLinesEqOrderSqPlusOrderPlusOne

def OrderExistenceClosed {A : AffinePlaneAxiomsPackage} (O : OrderExistencePackage A) : Prop :=
  O.orderIsPrimePower ∧ O.linesPerPointEqOrderPlusOne ∧ O.pointsPerLineEqOrderPlusOne ∧ O.totalPointsEqOrderSq ∧ O.totalLinesEqOrderSqPlusOrderPlusOne

theorem order_existence_closed_from_evidence {A : AffinePlaneAxiomsPackage} (O : OrderExistencePackage A) (E : OrderExistenceEvidence O) :
    OrderExistenceClosed O := by
  exact And.intro E.orderIsPrimePowerClosed
    (And.intro E.linesPerPointEqOrderPlusOneClosed
      (And.intro E.pointsPerLineEqOrderPlusOneClosed
        (And.intro E.totalPointsEqOrderSqClosed E.totalLinesEqOrderSqPlusOrderPlusOneClosed)))

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse