import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure ThermalFrictionModel where
  flashTemperature : ℝ
  ambientTemperature : ℝ
  frictionPower : ℝ
  thermalConductivity : ℝ
  contactArea : ℝ

structure ThermalFrictionEvidence (T : ThermalFrictionModel) where
  flashTemperatureNonneg : T.flashTemperature ≥ 0
  ambientTemperaturePos : T.ambientTemperature > 0
  frictionPowerNonneg : T.frictionPower ≥ 0
  thermalConductivityPos : T.thermalConductivity > 0
  contactAreaPos : T.contactArea > 0
  temperatureRise : T.flashTemperature - T.ambientTemperature = T.frictionPower / (T.thermalConductivity * T.contactArea)

def ThermalFrictionClosed (T : ThermalFrictionModel) : Prop :=
  T.flashTemperature ≥ 0 ∧ T.ambientTemperature > 0 ∧ T.frictionPower ≥ 0 ∧
  T.thermalConductivity > 0 ∧ T.contactArea > 0 ∧
  T.flashTemperature - T.ambientTemperature = T.frictionPower / (T.thermalConductivity * T.contactArea)

theorem thermal_friction_closed_from_evidence (T : ThermalFrictionModel) (E : ThermalFrictionEvidence T) :
    ThermalFrictionClosed T := by
  exact And.intro E.flashTemperatureNonneg (And.intro E.ambientTemperaturePos
    (And.intro E.frictionPowerNonneg (And.intro E.thermalConductivityPos
      (And.intro E.contactAreaPos E.temperatureRise))))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
