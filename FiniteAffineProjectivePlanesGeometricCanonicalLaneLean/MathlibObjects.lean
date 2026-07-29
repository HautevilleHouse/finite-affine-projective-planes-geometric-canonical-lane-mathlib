import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure FiniteProjectivePlane where
  point : Type
  line : Type
  incidence : point → line → Prop
  finite : Fintype point
  projective : Prop

structure AffinePlane where
  point : Type
  line : Type
  incidence : point → line → Prop
  finite : Fintype point
  affine : Prop

structure ProjectivePlaneFromAffine (A : AffinePlane) where
  pointAtInfinity : Type
  extendedIncidence : A.point ⊕ pointAtInfinity → Option (A.line ⊕ Type) → Prop
  projectiveConstruction : Prop

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse
