import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure WearMechanismsPackage where
  abrasiveWear : Prop
  adhesiveWear : Prop
  fatigueWear : Prop
  corrosiveWear : Prop
  wearRateEquation : Prop

structure WearMechanismsEvidence (W : WearMechanismsPackage) where
  abrasiveWearClosed : W.abrasiveWear
  adhesiveWearClosed : W.adhesiveWear
  fatigueWearClosed : W.fatigueWear
  corrosiveWearClosed : W.corrosiveWear
  wearRateEquationClosed : W.wearRateEquation

def WearMechanismsClosed (W : WearMechanismsPackage) : Prop :=
  W.abrasiveWear ∧ W.adhesiveWear ∧ W.fatigueWear ∧ W.corrosiveWear ∧ W.wearRateEquation

theorem wear_mechanisms_closed_from_evidence (W : WearMechanismsPackage) (E : WearMechanismsEvidence W) :
    WearMechanismsClosed W := by
  exact And.intro E.abrasiveWearClosed
    (And.intro E.adhesiveWearClosed
      (And.intro E.fatigueWearClosed
        (And.intro E.corrosiveWearClosed E.wearRateEquationClosed)))

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
