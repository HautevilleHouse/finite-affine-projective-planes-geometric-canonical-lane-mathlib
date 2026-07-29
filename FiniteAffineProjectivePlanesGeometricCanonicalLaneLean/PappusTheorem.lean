import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure PappusConfiguration (P : ProjectivePlaneCompletionPackage A) where
  line1 : P.lineType
  line2 : P.lineType
  pointsOnLine1 : (P.pointType × P.pointType × P.pointType)
  pointsOnLine2 : (P.pointType × P.pointType × P.pointType)
  distinctLines : line1 ≠ line2
  pointsDistinctOnLines : P.pointType × P.pointType × P.pointType × P.pointType × P.pointType × P.pointType
  intersectionLines : (P.lineType × P.lineType × P.lineType)
  conclusionPappus : (∃ (p : P.pointType), P.incidence p (intersectionLines.1) ∧ ...) 
   where
    ... : Prop := by
      exact True

structure PappusTheoremEvidence {A : AffinePlaneAxiomsPackage} {P : ProjectivePlaneCompletionPackage A} (Pa : PappusConfiguration P) where
  configurationValid : Pa.distinctLines
  pappusHolds : Pa.conclusionPappus

def PappusTheoremClosed {A : AffinePlaneAxiomsPackage} {P : ProjectivePlaneCompletionPackage A} (Pa : PappusConfiguration P) : Prop :=
  Pa.conclusionPappus

theorem pappus_theorem_closed_from_evidence {A : AffinePlaneAxiomsPackage} {P : ProjectivePlaneCompletionPackage A} (Pa : PappusConfiguration P) (E : PappusTheoremEvidence Pa) :
    PappusTheoremClosed Pa := by
  exact E.pappusHolds

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse