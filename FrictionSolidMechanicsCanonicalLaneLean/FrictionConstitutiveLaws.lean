import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure FrictionConstitutiveLawsPackage where
  coulombFriction : Prop
  rateAndStateLaw : Prop
  velocityDependence : Prop
  normalForceDependence : Prop
  stateEvolutionEquations : Prop

structure FrictionConstitutiveLawsEvidence (F : FrictionConstitutiveLawsPackage) where
  coulombFrictionClosed : F.coulombFriction
  rateAndStateLawClosed : F.rateAndStateLaw
  velocityDependenceClosed : F.velocityDependence
  normalForceDependenceClosed : F.normalForceDependence
  stateEvolutionEquationsClosed : F.stateEvolutionEquations

def FrictionConstitutiveLawsClosed (F : FrictionConstitutiveLawsPackage) : Prop :=
  F.coulombFriction ∧ F.rateAndStateLaw ∧ F.velocityDependence ∧ F.normalForceDependence ∧ F.stateEvolutionEquations

theorem friction_constitutive_laws_closed_from_evidence (F : FrictionConstitutiveLawsPackage) (E : FrictionConstitutiveLawsEvidence F) :
    FrictionConstitutiveLawsClosed F := by
  exact And.intro E.coulombFrictionClosed
    (And.intro E.rateAndStateLawClosed
      (And.intro E.velocityDependenceClosed
        (And.intro E.normalForceDependenceClosed E.stateEvolutionEquationsClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
