import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProjectivePlaneWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse