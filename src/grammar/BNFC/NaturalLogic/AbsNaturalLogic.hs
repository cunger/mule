

module AbsNaturalLogic where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Expression
    = Leaf Ident Ident Marking | Branch Ident Marking [Expression]
  deriving (Eq, Ord, Show, Read)

data Marking = Plus | Minus | None
  deriving (Eq, Ord, Show, Read)

