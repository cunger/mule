

module AbsAST where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Expression = Constant Ident | List [Expression]
  deriving (Eq, Ord, Show, Read)
