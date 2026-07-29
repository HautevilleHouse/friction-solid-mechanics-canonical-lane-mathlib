import FrictionSolidMechanicsCanonicalLaneLean.ContactMechanics

/-!
# Wear Analysis Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure WearAnalysisPackage {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} {M : ContactMechanicsPackage L} where
  wearRate : ℝ
  volumeLoss : ℝ
  archardLaw : Prop
  wearRegime : Prop
  archardLawClosed : archardLaw
  wearRegimeClosed : wearRegime

structure WearAnalysisEvidence {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} {M : ContactMechanicsPackage L} (W : WearAnalysisPackage M) where
  archardLawClosedEv : W.archardLawClosed
  wearRegimeClosedEv : W.wearRegimeClosed

def WearAnalysisClosed {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} {M : ContactMechanicsPackage L} (W : WearAnalysisPackage M) : Prop :=
  W.archardLaw ∧ W.wearRegime

theorem wear_analysis_closed_from_evidence {C : FrictionConstantsPackage} {L : FrictionLawsPackage C} {M : ContactMechanicsPackage L} (W : WearAnalysisPackage M) (E : WearAnalysisEvidence W) : WearAnalysisClosed W := by
  exact And.intro E.archardLawClosedEv E.wearRegimeClosedEv

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse