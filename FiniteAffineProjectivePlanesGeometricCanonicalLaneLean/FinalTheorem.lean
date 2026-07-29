import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

def ConstrainedProjectivePlaneClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_projective_plane_endgame (A : AdmissibleClass) :
    ConstrainedProjectivePlaneClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse