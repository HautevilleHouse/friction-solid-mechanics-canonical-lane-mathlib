import FrictionSolidMechanicsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

def ConstrainedFrictionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_friction_endgame (A : AdmissibleClass) :
    ConstrainedFrictionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse