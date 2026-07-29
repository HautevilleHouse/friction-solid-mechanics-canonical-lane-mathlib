import FrictionSolidMechanicsCanonicalLaneLean.RoughSurfaceContact

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure FrictionLawPackage {R : RoughSurfaceContactPackage} where
  normalForceModel : Prop
  tangentialReaction : Prop
  staticCoefficient : ℝ
  kineticCoefficient : ℝ
  stickSlipCondition : Prop

structure FrictionLawEvidence {R : RoughSurfaceContactPackage} (F : FrictionLawPackage R) where
  normalForceModelClosed : F.normalForceModel
  tangentialReactionClosed : F.tangentialReaction
  stickSlipConditionClosed : F.stickSlipCondition

def FrictionLawClosed {R : RoughSurfaceContactPackage} (F : FrictionLawPackage R) : Prop :=
  F.normalForceModel ∧ F.tangentialReaction ∧ F.stickSlipCondition

theorem friction_law_closed_from_evidence {R : RoughSurfaceContactPackage}
    (F : FrictionLawPackage R) (E : FrictionLawEvidence F) : FrictionLawClosed F := by
  exact And.intro E.normalForceModelClosed (And.intro E.tangentialReactionClosed E.stickSlipConditionClosed)

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse