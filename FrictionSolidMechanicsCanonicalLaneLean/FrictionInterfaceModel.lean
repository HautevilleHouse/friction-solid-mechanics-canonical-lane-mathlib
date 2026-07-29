import FrictionSolidMechanicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure FrictionInterfaceModel where
  normalStress : Prop
  shearStress : Prop
  frictionCoefficient : Prop
  slipCondition : Prop
  stickCondition : Prop
  coulombCriterion : Prop
  interfaceRegularity : Prop
  adhesionContribution : Prop
  plasticDeformation : Prop
  energyDissipation : Prop
  normalStressClosed : normalStress
  shearStressClosed : shearStress
  frictionCoefficientClosed : frictionCoefficient
  slipConditionClosed : slipCondition
  stickConditionClosed : stickCondition
  coulombCriterionClosed : coulombCriterion
  interfaceRegularityClosed : interfaceRegularity
  adhesionContributionClosed : adhesionContribution
  plasticDeformationClosed : plasticDeformation
  energyDissipationClosed : energyDissipation

structure FrictionInterfaceEvidence (M : FrictionInterfaceModel) where
  normalStressClosed : M.normalStress
  shearStressClosed : M.shearStress
  frictionCoefficientClosed : M.frictionCoefficient
  slipConditionClosed : M.slipCondition
  stickConditionClosed : M.stickCondition
  coulombCriterionClosed : M.coulombCriterion
  interfaceRegularityClosed : M.interfaceRegularity
  adhesionContributionClosed : M.adhesionContribution
  plasticDeformationClosed : M.plasticDeformation
  energyDissipationClosed : M.energyDissipation

def FrictionInterfaceClosed (M : FrictionInterfaceModel) : Prop :=
  M.normalStress ∧ M.shearStress ∧ M.frictionCoefficient ∧
  M.slipCondition ∧ M.stickCondition ∧ M.coulombCriterion ∧
  M.interfaceRegularity ∧ M.adhesionContribution ∧
  M.plasticDeformation ∧ M.energyDissipation

theorem friction_interface_closed_from_evidence
    (M : FrictionInterfaceModel) (E : FrictionInterfaceEvidence M) :
    FrictionInterfaceClosed M := by
  exact And.intro E.normalStressClosed
    (And.intro E.shearStressClosed
      (And.intro E.frictionCoefficientClosed
        (And.intro E.slipConditionClosed
          (And.intro E.stickConditionClosed
            (And.intro E.coulombCriterionClosed
              (And.intro E.interfaceRegularityClosed
                (And.intro E.adhesionContributionClosed
                  (And.intro E.plasticDeformationClosed
                    E.energyDissipationClosed))))))))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse