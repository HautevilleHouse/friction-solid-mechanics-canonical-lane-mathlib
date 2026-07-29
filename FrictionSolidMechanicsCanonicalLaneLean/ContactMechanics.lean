import FrictionSolidMechanicsCanonicalLaneLean.FrictionLaws

/-!
# Contact Mechanics Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure ContactMechanicsPackage {C : FrictionConstantsPackage} (L : FrictionLawsPackage C) where
  normalForce : Type u
  shearForce : Type v
  contactArea : Type w
  pressureDistribution : Prop
  stickRegion : Prop
  slipRegion : Prop
  pressureDistributionClosed : pressureDistribution
  stickRegionClosed : stickRegion
  slipRegionClosed : slipRegion

structure ContactMechanicsEvidence {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} (M : ContactMechanicsPackage L) where
  pressureDistributionClosedEv : M.pressureDistributionClosed
  stickRegionClosedEv : M.stickRegionClosed
  slipRegionClosedEv : M.slipRegionClosed

def ContactMechanicsClosed {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} (M : ContactMechanicsPackage L) : Prop :=
  M.pressureDistribution ∧ M.stickRegion ∧ M.slipRegion

theorem contact_mechanics_closed_from_evidence {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} (M : ContactMechanicsPackage L) (E : ContactMechanicsEvidence M) : ContactMechanicsClosed M := by
  exact And.intro E.pressureDistributionClosedEv (And.intro E.stickRegionClosedEv E.slipRegionClosedEv)

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse