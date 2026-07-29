import FrictionSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def frictionProjection : Projection FrictionEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem friction_projection_idempotent (x : FrictionEndgameState) :
    frictionProjection.toFun (frictionProjection.toFun x) = frictionProjection.toFun x := by
  exact frictionProjection.idempotent x

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse