module Lambda where

import ErrM
import AbsTPTP
import ParTPTP
import PrintTPTP


run :: String -> String
run str = case (pExpression $ myLexer $ str) of
                Ok e -> printTree $ reduce e
                _    -> error $ "BNFC failed to parse: " ++ str

reduce :: Expression -> Expression
reduce e@(Application (Abstraction (Ident v) e1) e2) = reduce $ replace v e2 e1
                           -- TODO variable renaming
reduce (Application e1@(Application _ _) e2)
                              = case reduce e1 of
                                     e@(Abstraction _ _) -> reduce (Application e e2)
                                     e                   -> Application e (reduce e2)
reduce (Application e1 e2)    = Application e1 (reduce e2)
reduce (Conjunction e1 e2)    = Conjunction (reduce e1) (reduce e2)
reduce (Disjunction e1 e2)    = Disjunction (reduce e1) (reduce e2)
reduce (Implication e1 e2)    = Implication (reduce e1) (reduce e2)
reduce (Negation e)           = Negation    (reduce e)
reduce (Abstraction v e)      = Abstraction v (reduce e)
reduce (Predication p es)     = Predication p (map reduce es)
reduce (Quantification q v e) = Quantification q v (reduce e)
reduce e = e

-- replace Variable with Expression in Expression
replace :: String -> Expression -> Expression -> Expression
replace v e' e@(Term (Ident str))
  | str == v  = e'
  | otherwise = e
replace v e' e''@(Abstraction var@(Ident str) e)
  | str == v  = e''
  | otherwise = Abstraction var (replace v e' e)
replace v e' (Application f arg)  = Application (replace v e' f) (replace v e' arg)
replace v e' (Predication p args) = Predication p (map (replace v e') args)
replace v e' (Conjunction e1 e2)  = Conjunction (replace v e' e1) (replace v e' e2)
replace v e' (Disjunction e1 e2)  = Disjunction (replace v e' e1) (replace v e' e2)
replace v e' (Implication e1 e2)  = Implication (replace v e' e1) (replace v e' e2)
replace v e' (Negation e)         = Negation    (replace v e' e)
replace v e' e''@(Quantification q (Ident str) e)
  | str == v    = e''
  | otherwise   = Quantification q (Ident str) (replace v e' e)
