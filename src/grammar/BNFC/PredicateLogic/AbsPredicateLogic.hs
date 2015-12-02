

module AbsPredicateLogic where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Expression
    = Term Ident
    | Predication Ident [Expression]
    | Conjunction Expression Expression
    | Disjunction Expression Expression
    | Implication Expression Expression
    | Negation Expression
    | Abstraction Ident Expression
    | Application Expression Expression
    | Quantification Quantifier Ident Expression Expression
  deriving (Eq, Ord, Show, Read)

data Quantifier = Exists | Forall | Most | Many | The | No | Few
  deriving (Eq, Ord, Show, Read)

