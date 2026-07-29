import FrictionSolidMechanicsCanonicalLaneLean.ContactMechanics

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure RoughSurfaceContactPackage {C : ContactMechanicsPackage} where
  surfaceRoughnessModel : Prop
  asperityDeformation : Prop
  realContactArea : Prop
  adhesionComponent : Prop

structure RoughSurfaceContactEvidence {C : ContactMechanicsPackage}
    (R : RoughSurfaceContactPackage C) where
  surfaceRoughnessModelClosed : R.surfaceRoughnessModel
  asperityDeformationClosed : R.asperityDeformation
  realContactAreaClosed : R.realContactArea
  adhesionComponentClosed : R.adhesionComponent

def RoughSurfaceContactClosed {C : ContactMechanicsPackage}
    (R : RoughSurfaceContactPackage C) : Prop :=
  R.surfaceRoughnessModel ∧ R.asperityDeformation ∧
  R.realContactArea ∧ R.adhesionComponent

theorem rough_surface_contact_closed_from_evidence
    {C : ContactMechanicsPackage} (R : RoughSurfaceContactPackage C)
    (E : RoughSurfaceContactEvidence R) : RoughSurfaceContactClosed R := by
  exact And.intro E.surfaceRoughnessModelClosed
    (And.intro E.asperityDeformationClosed
      (And.intro E.realContactAreaClosed E.adhesionComponentClosed))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse