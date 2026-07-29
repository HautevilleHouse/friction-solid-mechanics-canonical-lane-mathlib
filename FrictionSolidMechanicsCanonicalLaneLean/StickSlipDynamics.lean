import FrictionSolidMechanicsCanonicalLaneLean.CoulombFrictionLaw

/-!
# Stick-Slip Dynamics Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure StickSlipPackage {C : CoulombFrictionPackage} where
  staticCoefficient : Prop
  kineticCoefficient : Prop
  stickCondition : Prop
  slipCondition : Prop
  stickSlipTransition : Prop

structure StickSlipEvidence {C : CoulombFrictionPackage} (S : StickSlipPackage C) where
  staticCoefficientClosed : S.staticCoefficient
  kineticCoefficientClosed : S.kineticCoefficient
  stickConditionClosed : S.stickCondition
  slipConditionClosed : S.slipCondition
  stickSlipTransitionClosed : S.stickSlipTransition

def StickSlipClosed {C : CoulombFrictionPackage} (S : StickSlipPackage C) : Prop :=
  S.staticCoefficient ∧ S.kineticCoefficient ∧
  S.stickCondition ∧ S.slipCondition ∧ S.stickSlipTransition

theorem stick_slip_closed_from_evidence {C : CoulombFrictionPackage}
    (S : StickSlipPackage C) (E : StickSlipEvidence S) :
    StickSlipClosed S := by
  exact And.intro E.staticCoefficientClosed
    (And.intro E.kineticCoefficientClosed
      (And.intro E.stickConditionClosed
        (And.intro E.slipConditionClosed E.stickSlipTransitionClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse