import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure AffinePlanePackage where
  points : Type u
  lines : Type v
  incidence : points → lines → Prop
  parallelRelation : lines → lines → Prop
  axiomsSatisfied : Prop
  finiteCardinal : ℕ

def AffinePlaneClosed (A : AffinePlanePackage) : Prop :=
  A.axiomsSatisfied ∧ A.finiteCardinal > 1

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse