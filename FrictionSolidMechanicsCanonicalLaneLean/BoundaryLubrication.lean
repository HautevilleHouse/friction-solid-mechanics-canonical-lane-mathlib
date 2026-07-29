import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure BoundaryLubricationPackage where
  lubricantFilmThickness : Prop
  asperityContactRatio : Prop
  stribeckCurve : Prop
  additiveEffects : Prop
  filmFailureCriteria : Prop

structure BoundaryLubricationEvidence (B : BoundaryLubricationPackage) where
  lubricantFilmThicknessClosed : B.lubricantFilmThickness
  asperityContactRatioClosed : B.asperityContactRatio
  stribeckCurveClosed : B.stribeckCurve
  additiveEffectsClosed : B.additiveEffects
  filmFailureCriteriaClosed : B.filmFailureCriteria

def BoundaryLubricationClosed (B : BoundaryLubricationPackage) : Prop :=
  B.lubricantFilmThickness ∧ B.asperityContactRatio ∧ B.stribeckCurve ∧ B.additiveEffects ∧ B.filmFailureCriteria

theorem boundary_lubrication_closed_from_evidence (B : BoundaryLubricationPackage) (E : BoundaryLubricationEvidence B) :
    BoundaryLubricationClosed B := by
  exact And.intro E.lubricantFilmThicknessClosed
    (And.intro E.asperityContactRatioClosed
      (And.intro E.stribeckCurveClosed
        (And.intro E.additiveEffectsClosed E.filmFailureCriteriaClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
