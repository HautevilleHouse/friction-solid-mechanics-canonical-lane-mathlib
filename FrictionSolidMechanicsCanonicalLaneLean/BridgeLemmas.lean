import FrictionSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FrictionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse