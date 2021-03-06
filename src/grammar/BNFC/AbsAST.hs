

module AbsAST where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Expression
    = Wildcard
    | Slot Integer
    | Constant Ident
    | List [Expression]
    | Change Relation
  deriving (Eq, Ord, Show, Read)

data Edit = Rewrite Expression Relation Expression
  deriving (Eq, Ord, Show, Read)

data Relation
    = Equivalent
    | Entails
    | IsEntailedBy
    | Excludes
    | DisjointWith
    | Overlaps
    | IndependentOf
    | None
    | Presupposes
    | Implicates
  deriving (Eq, Ord, Show, Read)

