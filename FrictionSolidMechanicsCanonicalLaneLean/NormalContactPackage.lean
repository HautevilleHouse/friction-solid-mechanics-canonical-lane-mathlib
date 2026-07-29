import FrictionSolidMechanicsCanonicalLaneLean.AdmissibleClass

/-!
# Normal Contact Package
-/

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure NormalContactPackage where
  contactSurface : Type u
  normalStress : Type v
  contactArea : Prop
  pressureDistribution : Prop

structure NormalContactEvidence (G : NormalContactPackage) where
  contactAreaClosed : G.contactArea
  pressureDistributionClosed : G.pressureDistribution

def NormalContactClosed (G : NormalContactPackage) : Prop :=
  G.contactArea ∧ G.pressureDistribution

theorem normal_contact_closed_from_evidence (G : NormalContactPackage)
    (E : NormalContactEvidence G) : NormalContactClosed G := by
  exact And.intro E.contactAreaClosed E.pressureDistributionClosed

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse