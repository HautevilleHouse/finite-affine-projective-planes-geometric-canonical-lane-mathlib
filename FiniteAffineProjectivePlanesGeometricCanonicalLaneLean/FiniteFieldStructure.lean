import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAffineProjectivePlanesGeometricCanonicalLaneLean

structure FiniteFieldStructurePackage where
  fieldType : Type u
  zero : fieldType
  one : fieldType
  plus : fieldType → fieldType → fieldType
  times : fieldType → fieldType → fieldType
  addAssoc : ∀ a b c : fieldType, plus (plus a b) c = plus a (plus b c)
  addComm : ∀ a b : fieldType, plus a b = plus b a
  zeroAdd : ∀ a : fieldType, plus zero a = a
  addInv : ∀ a : fieldType, ∃ b : fieldType, plus a b = zero
  mulAssoc : ∀ a b c : fieldType, times (times a b) c = times a (times b c)
  mulComm : ∀ a b : fieldType, times a b = times b a
  oneMul : ∀ a : fieldType, times one a = a
  mulInv : ∀ a : fieldType, a ≠ zero → ∃ b : fieldType, times a b = one
  distrib : ∀ a b c : fieldType, times a (plus b c) = plus (times a b) (times a c)
  finite : Fintype fieldType

structure FiniteFieldStructureEvidence (F : FiniteFieldStructurePackage) where
  addAssocClosed : F.addAssoc
  addCommClosed : F.addComm
  zeroAddClosed : F.zeroAdd
  addInvClosed : F.addInv
  mulAssocClosed : F.mulAssoc
  mulCommClosed : F.mulComm
  oneMulClosed : F.oneMul
  mulInvClosed : F.mulInv
  distribClosed : F.distrib
  finiteClosed : F.finite

def FiniteFieldStructureClosed (F : FiniteFieldStructurePackage) : Prop :=
  F.addAssoc ∧ F.addComm ∧ F.zeroAdd ∧ F.addInv ∧ F.mulAssoc ∧ F.mulComm ∧ F.oneMul ∧ F.mulInv ∧ F.distrib ∧ Fintype F.fieldType

theorem finite_field_structure_closed_from_evidence (F : FiniteFieldStructurePackage) (E : FiniteFieldStructureEvidence F) :
    FiniteFieldStructureClosed F := by
  exact And.intro E.addAssocClosed
    (And.intro E.addCommClosed
      (And.intro E.zeroAddClosed
        (And.intro E.addInvClosed
          (And.intro E.mulAssocClosed
            (And.intro E.mulCommClosed
              (And.intro E.oneMulClosed
                (And.intro E.mulInvClosed
                  (And.intro E.distribClosed E.finiteClosed))))))))

end FiniteAffineProjectivePlanesGeometricCanonicalLaneLean
end HautevilleHouse