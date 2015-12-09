module SkelNaturalLogic where

-- Haskell module generated by the BNF converter

import AbsNaturalLogic
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transIdent :: Ident -> Result
transIdent x = case x of
  Ident string -> failure x
transExpression :: Expression -> Result
transExpression x = case x of
  Leaf ident1 ident2 marking -> failure x
  Branch ident marking expressions -> failure x
transMarking :: Marking -> Result
transMarking x = case x of
  Plus -> failure x
  Minus -> failure x
  None -> failure x

