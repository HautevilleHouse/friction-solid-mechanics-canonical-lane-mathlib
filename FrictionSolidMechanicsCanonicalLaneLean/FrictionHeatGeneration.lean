import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure FrictionHeatGenerationPackage where
  frictionalWorkToHeatRatio : Prop
  temperatureRiseModel : Prop
  thermalDiffusion : Prop
  heatAffectedZone : Prop
  flashTemperature : Prop

structure FrictionHeatGenerationEvidence (H : FrictionHeatGenerationPackage) where
  frictionalWorkToHeatRatioClosed : H.frictionalWorkToHeatRatio
  temperatureRiseModelClosed : H.temperatureRiseModel
  thermalDiffusionClosed : H.thermalDiffusion
  heatAffectedZoneClosed : H.heatAffectedZone
  flashTemperatureClosed : H.flashTemperature

def FrictionHeatGenerationClosed (H : FrictionHeatGenerationPackage) : Prop :=
  H.frictionalWorkToHeatRatio ∧ H.temperatureRiseModel ∧ H.thermalDiffusion ∧ H.heatAffectedZone ∧ H.flashTemperature

theorem friction_heat_generation_closed_from_evidence (H : FrictionHeatGenerationPackage) (E : FrictionHeatGenerationEvidence H) :
    FrictionHeatGenerationClosed H := by
  exact And.intro E.frictionalWorkToHeatRatioClosed
    (And.intro E.temperatureRiseModelClosed
      (And.intro E.thermalDiffusionClosed
        (And.intro E.heatAffectedZoneClosed E.flashTemperatureClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
