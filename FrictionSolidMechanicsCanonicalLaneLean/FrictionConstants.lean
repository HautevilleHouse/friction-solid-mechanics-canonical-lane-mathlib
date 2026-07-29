import FrictionSolidMechanicsCanonicalLaneLean.AdmissibleClass

/-!
# Friction Constants Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure FrictionConstantsPackage where
  coefficientStatic : ℝ
  coefficientKinetic : ℝ
  adhesionCoefficient : ℝ
  roughnessScale : ℝ
  contactPressureLimit : ℝ
  staticDefined : coefficientStatic > 0
  kineticDefined : coefficientKinetic > 0
  adhesionDefined : adhesionCoefficient ≥ 0
  roughnessDefined : roughnessScale > 0
  pressureLimitDefined : contactPressureLimit > 0

structure FrictionConstantsEvidence (C : FrictionConstantsPackage) where
  staticDefinedClosed : C.staticDefined
  kineticDefinedClosed : C.kineticDefined
  adhesionDefinedClosed : C.adhesionDefined
  roughnessDefinedClosed : C.roughnessDefined
  pressureLimitDefinedClosed : C.pressureLimitDefined

def FrictionConstantsClosed (C : FrictionConstantsPackage) : Prop :=
  C.staticDefined ∧ C.kineticDefined ∧ C.adhesionDefined ∧ C.roughnessDefined ∧ C.pressureLimitDefined

theorem friction_constants_closed_from_evidence (C : FrictionConstantsPackage) (E : FrictionConstantsEvidence C) : FrictionConstantsClosed C := by
  exact And.intro E.staticDefinedClosed (And.intro E.kineticDefinedClosed (And.intro E.adhesionDefinedClosed (And.intro E.roughnessDefinedClosed E.pressureLimitDefinedClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse