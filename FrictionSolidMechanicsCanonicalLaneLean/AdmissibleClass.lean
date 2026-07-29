import FrictionSolidMechanicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : FrictionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FrictionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse