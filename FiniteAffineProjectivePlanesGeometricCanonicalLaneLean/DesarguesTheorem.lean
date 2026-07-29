import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAffineProjectivePlanesGeometricCanonicalLaneLean.ProjectiveCompletion

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure DesarguesPackage (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A) where
  desarguesStatement : Prop
  holds : Prop

structure DesarguesEvidence (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A) (D : DesarguesPackage A P) where
  holdsClosed : D.holds

def DesarguesClosed (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A) (D : DesarguesPackage A P) : Prop :=
  D.holds ∧ ProjectiveCompletionClosed A P

theorem desargues_closed_from_evidence (A : AffinePlanePackage) (P : ProjectiveCompletionPackage A) (D : DesarguesPackage A P)
    (E : DesarguesEvidence A P D) (PClosed : ProjectiveCompletionClosed A P) : DesarguesClosed A P D := by
  exact And.intro E.holdsClosed PClosed

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse