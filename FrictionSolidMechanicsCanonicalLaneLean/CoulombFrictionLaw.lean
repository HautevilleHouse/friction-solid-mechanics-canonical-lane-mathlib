import FrictionSolidMechanicsCanonicalLaneLean.AdmissibleClass

/-!
# Coulomb Friction Law Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure CoulombFrictionPackage (G : NormalContactPackage) where
  normalForce : Type u
  frictionCoefficient : Type v
  limitingFrictionEquation : Prop
  directionOpposesMotion : Prop

structure CoulombFrictionEvidence {G : NormalContactPackage} (F : CoulombFrictionPackage G) where
  limitingFrictionEquationClosed : F.limitingFrictionEquation
  directionOpposesMotionClosed : F.directionOpposesMotion

def CoulombFrictionClosed {G : NormalContactPackage} (F : CoulombFrictionPackage G) : Prop :=
  F.limitingFrictionEquation ∧ F.directionOpposesMotion

theorem coulomb_friction_closed_from_evidence {G : NormalContactPackage}
    (F : CoulombFrictionPackage G) (E : CoulombFrictionEvidence F) :
    CoulombFrictionClosed F := by
  exact And.intro E.limitingFrictionEquationClosed E.directionOpposesMotionClosed

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse