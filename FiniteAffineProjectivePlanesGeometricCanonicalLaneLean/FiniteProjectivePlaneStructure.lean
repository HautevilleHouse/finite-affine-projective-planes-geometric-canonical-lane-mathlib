import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure FiniteAffineProjectivePlane where
  point : Type u
  line : Type v
  incidence : point → line → Prop
  pointCount : ℕ
  lineCount : ℕ
  pointCountPos : pointCount > 0
  lineCountPos : lineCount > 0
  axiomsSatisfied : Prop
  axiomsSatisfiedTerm : axiomsSatisfied
  conclusion : PlaneWitnessClosed this

def PlaneWitnessClosed (P : FiniteAffineProjectivePlane) : Prop :=
  P.axiomsSatisfied

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse