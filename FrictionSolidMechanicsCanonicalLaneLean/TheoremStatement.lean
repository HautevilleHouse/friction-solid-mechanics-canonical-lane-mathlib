import FrictionSolidMechanicsCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace FrictionSolidMechanicsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "friction-solid-mechanics-canonical-lane",
  theoremName := "Friction Solid Mechanics Admissible Closure",
  theoremObject := "Constitutive friction and contact mechanics",
  classicalBoundary := "Unrestricted classical closure carried as open boundary",
  manifoldConstrainedStatement := "Friction Solid Mechanics admissible closure internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
  certificateLane := "manifold_constrained",
  carriedRemainder := "Classical source boundary carried by formalization.Certificate"
}

end FrictionSolidMechanicsCanonicalLaneLean
end HautevilleHouse
