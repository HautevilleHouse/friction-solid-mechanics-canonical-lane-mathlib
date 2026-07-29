import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure StickSlipInstabilityPackage where
  springSliderModel : Prop
  criticalStiffness : Prop
  bifurcationAnalysis : Prop
  limitCycleDynamics : Prop
  parameterDependence : Prop

structure StickSlipInstabilityEvidence (S : StickSlipInstabilityPackage) where
  springSliderModelClosed : S.springSliderModel
  criticalStiffnessClosed : S.criticalStiffness
  bifurcationAnalysisClosed : S.bifurcationAnalysis
  limitCycleDynamicsClosed : S.limitCycleDynamics
  parameterDependenceClosed : S.parameterDependence

def StickSlipInstabilityClosed (S : StickSlipInstabilityPackage) : Prop :=
  S.springSliderModel ∧ S.criticalStiffness ∧ S.bifurcationAnalysis ∧ S.limitCycleDynamics ∧ S.parameterDependence

theorem stick_slip_instability_closed_from_evidence (S : StickSlipInstabilityPackage) (E : StickSlipInstabilityEvidence S) :
    StickSlipInstabilityClosed S := by
  exact And.intro E.springSliderModelClosed
    (And.intro E.criticalStiffnessClosed
      (And.intro E.bifurcationAnalysisClosed
        (And.intro E.limitCycleDynamicsClosed E.parameterDependenceClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
