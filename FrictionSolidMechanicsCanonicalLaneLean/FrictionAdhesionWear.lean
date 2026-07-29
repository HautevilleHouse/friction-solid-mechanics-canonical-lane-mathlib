import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure AdhesionWearModel where
  adhesionForce : ℝ
  wearVolume : ℝ
  slidingDistance : ℝ
  hardness : ℝ
  wearCoefficient : ℝ

structure AdhesionWearEvidence (A : AdhesionWearModel) where
  adhesionForceNonneg : A.adhesionForce ≥ 0
  wearVolumeNonneg : A.wearVolume ≥ 0
  slidingDistancePos : A.slidingDistance > 0
  hardnessPos : A.hardness > 0
  wearCoefficientNonneg : A.wearCoefficient ≥ 0
  archardRelation : A.wearVolume = A.wearCoefficient * A.adhesionForce * A.slidingDistance / A.hardness

def AdhesionWearClosed (A : AdhesionWearModel) : Prop :=
  A.adhesionForce ≥ 0 ∧ A.wearVolume ≥ 0 ∧ A.slidingDistance > 0 ∧
  A.hardness > 0 ∧ A.wearCoefficient ≥ 0 ∧
  A.wearVolume = A.wearCoefficient * A.adhesionForce * A.slidingDistance / A.hardness

theorem adhesion_wear_closed_from_evidence (A : AdhesionWearModel) (E : AdhesionWearEvidence A) :
    AdhesionWearClosed A := by
  exact And.intro E.adhesionForceNonneg (And.intro E.wearVolumeNonneg
    (And.intro E.slidingDistancePos (And.intro E.hardnessPos
      (And.intro E.wearCoefficientNonneg E.archardRelation))))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
