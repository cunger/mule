

module AbsTree where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Tree = Leaf Ident Marking | Branch Ident Marking [Tree]
  deriving (Eq, Ord, Show, Read)

data Marking = Plus | Minus | None
  deriving (Eq, Ord, Show, Read)
