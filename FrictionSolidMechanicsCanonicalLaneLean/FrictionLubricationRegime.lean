import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure LubricationRegimeModel where
  viscosity : ℝ
  slidingSpeed : ℝ
  normalLoad : ℝ
  filmThickness : ℝ
  surfaceRoughness : ℝ

structure LubricationRegimeEvidence (L : LubricationRegimeModel) where
  viscosityPos : L.viscosity > 0
  slidingSpeedNonneg : L.slidingSpeed ≥ 0
  normalLoadPos : L.normalLoad > 0
  filmThicknessNonneg : L.filmThickness ≥ 0
  surfaceRoughnessNonneg : L.surfaceRoughness ≥ 0
  sommerfeldNumber : ℝ
  sommerfeldNumberDefined : L.sommerfeldNumber = L.viscosity * L.slidingSpeed / (L.normalLoad)
  regimeClassification : L.sommerfeldNumber > 0

def LubricationRegimeClosed (L : LubricationRegimeModel) : Prop :=
  L.viscosity > 0 ∧ L.slidingSpeed ≥ 0 ∧ L.normalLoad > 0 ∧
  L.filmThickness ≥ 0 ∧ L.surfaceRoughness ≥ 0 ∧
  (let S := L.viscosity * L.slidingSpeed / (L.normalLoad); S > 0)

theorem lubrication_regime_closed_from_evidence (L : LubricationRegimeModel) (E : LubricationRegimeEvidence L) :
    LubricationRegimeClosed L := by
  have hSpos : (L.viscosity * L.slidingSpeed / (L.normalLoad)) > 0 := by
    have : L.viscosity > 0 := E.viscosityPos
    have : L.slidingSpeed ≥ 0 := E.slidingSpeedNonneg
    have : L.normalLoad > 0 := E.normalLoadPos
    positivity
  exact And.intro E.viscosityPos (And.intro E.slidingSpeedNonneg
    (And.intro E.normalLoadPos (And.intro E.filmThicknessNonneg
      (And.intro E.surfaceRoughnessNonneg hSpos))))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
