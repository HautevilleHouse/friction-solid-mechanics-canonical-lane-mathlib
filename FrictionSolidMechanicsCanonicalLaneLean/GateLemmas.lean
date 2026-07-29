import FrictionSolidMechanicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse