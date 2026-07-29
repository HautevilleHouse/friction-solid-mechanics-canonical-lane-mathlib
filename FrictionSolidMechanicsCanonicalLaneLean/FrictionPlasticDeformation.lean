import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure PlasticDeformationModel where
  yieldStress : ℝ
  shearStress : ℝ
  plasticStrain : ℝ
  hardeningModulus : ℝ
  cumulativePlasticStrain : ℝ

structure PlasticDeformationEvidence (P : PlasticDeformationModel) where
  yieldStressPos : P.yieldStress > 0
  shearStressNonneg : P.shearStress ≥ 0
  plasticStrainNonneg : P.plasticStrain ≥ 0
  hardeningModulusNonneg : P.hardeningModulus ≥ 0
  cumulativePlasticStrainNonneg : P.cumulativePlasticStrain ≥ 0
  yieldCriterion : P.shearStress ≤ P.yieldStress + P.hardeningModulus * P.cumulativePlasticStrain

def PlasticDeformationClosed (P : PlasticDeformationModel) : Prop :=
  P.yieldStress > 0 ∧ P.shearStress ≥ 0 ∧ P.plasticStrain ≥ 0 ∧
  P.hardeningModulus ≥ 0 ∧ P.cumulativePlasticStrain ≥ 0 ∧
  P.shearStress ≤ P.yieldStress + P.hardeningModulus * P.cumulativePlasticStrain

theorem plastic_deformation_closed_from_evidence (P : PlasticDeformationModel) (E : PlasticDeformationEvidence P) :
    PlasticDeformationClosed P := by
  exact And.intro E.yieldStressPos (And.intro E.shearStressNonneg
    (And.intro E.plasticStrainNonneg (And.intro E.hardeningModulusNonneg
      (And.intro E.cumulativePlasticStrainNonneg E.yieldCriterion))))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
