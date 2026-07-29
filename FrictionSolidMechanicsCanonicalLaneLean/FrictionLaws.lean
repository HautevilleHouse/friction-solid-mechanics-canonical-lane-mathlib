import FrictionSolidMechanicsCanonicalLaneLean.FrictionConstants

/-!
# Friction Laws Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure FrictionLawsPackage (C : FrictionConstantsPackage) where
  coulombLaw : Prop
  staticEquilibrium : Prop
  kineticSliding : Prop
  limitingFriction : Prop
  coulombLawClosed : coulombLaw
  staticEquilibriumClosed : staticEquilibrium
  kineticSlidingClosed : kineticSliding
  limitingFrictionClosed : limitingFriction

structure FrictionLawsEvidence {C : FrictionConstantsPackage} (L : FrictionLawsPackage C) where
  coulombLawClosedEv : L.coulombLawClosed
  staticEquilibriumClosedEv : L.staticEquilibriumClosed
  kineticSlidingClosedEv : L.kineticSlidingClosed
  limitingFrictionClosedEv : L.limitingFrictionClosed

def FrictionLawsClosed {C : FrictionConstantsPackage} (L : FrictionLawsPackage C) : Prop :=
  L.coulombLaw ∧ L.staticEquilibrium ∧ L.kineticSliding ∧ L.limitingFriction

theorem friction_laws_closed_from_evidence {C : FrictionConstantsPackage} (L : FrictionLawsPackage C) (E : FrictionLawsEvidence L) : FrictionLawsClosed L := by
  exact And.intro E.coulombLawClosedEv (And.intro E.staticEquilibriumClosedEv (And.intro E.kineticSlidingClosedEv E.limitingFrictionClosedEv))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse