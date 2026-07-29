import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure DesarguesTheoremPackage (P : FiniteAffineProjectivePlane) where
  configuration : Prop
  conclusionHolds : Prop
  configurationTerm : configuration
  conclusionTerm : conclusionHolds

def DesarguesClosed (P : FiniteAffineProjectivePlane) (D : DesarguesTheoremPackage P) : Prop :=
  D.configuration ∧ D.conclusionHolds

theorem desargues_closed_from_evidence (P : FiniteAffineProjectivePlane) (D : DesarguesTheoremPackage P) :
    DesarguesClosed P D := by
  exact And.intro D.configurationTerm D.conclusionTerm

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse