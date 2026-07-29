import FrictionSolidMechanicsCanonicalLaneLean.FrictionAdmissibleObject
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure FrictionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FrictionAdmittedObject where
  space : FrictionSpace
  continuousBody : Prop
  interfaceModel : FrictionInterfaceModel
  interfaceClosed : FrictionInterfaceClosed interfaceModel
  conclusion : Prop

structure FrictionEndgameState where
  object : FrictionAdmittedObject

def FrictionWitnessClosed (O : FrictionAdmittedObject) : Prop :=
  O.conclusion

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse