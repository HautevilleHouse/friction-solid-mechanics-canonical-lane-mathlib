import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure CoulombFrictionModel where
  normalForce : ℝ
  frictionCoefficient : ℝ
  staticFrictionLimit : ℝ
  kineticFrictionForce : ℝ

structure CoulombFrictionEvidence (C : CoulombFrictionModel) where
  normalForcePositive : C.normalForce > 0
  frictionCoefficientNonneg : C.frictionCoefficient ≥ 0
  staticFrictionLimitDefined : C.staticFrictionLimit = C.frictionCoefficient * C.normalForce
  kineticFrictionForceDefined : C.kineticFrictionForce = C.frictionCoefficient * C.normalForce

def CoulombFrictionClosed (C : CoulombFrictionModel) : Prop :=
  C.normalForce > 0 ∧ C.frictionCoefficient ≥ 0 ∧
  C.staticFrictionLimit = C.frictionCoefficient * C.normalForce ∧
  C.kineticFrictionForce = C.frictionCoefficient * C.normalForce

theorem coulomb_friction_closed_from_evidence (C : CoulombFrictionModel) (E : CoulombFrictionEvidence C) :
    CoulombFrictionClosed C := by
  exact And.intro E.normalForcePositive (And.intro E.frictionCoefficientNonneg
    (And.intro E.staticFrictionLimitDefined E.kineticFrictionForceDefined))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
