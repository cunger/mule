module Rules where

import AbsNaturalLogic
import Interpretation


type Rule = Expression -> [Expression]


relation2relation :: (String,String) -> (String,String) -> Rule
relation2relation (c1,s1) (c2,s2)       (Branch c' m [ Leaf (Ident c)  (Ident s)  m', np ])
  | m == Plus  && c == c1 && s == s1 = [ Branch c' m [ Leaf (Ident c2) (Ident s2) m', np ] ]
  | m == Minus && c == c2 && s == s2 = [ Branch c' m [ Leaf (Ident c1) (Ident s1) m', np ] ]
  | otherwise           = []
relation2relation _ _ _ = []

predicate2predicate :: (String,String) -> (String,String) -> Rule
predicate2predicate (c1,s1) (c2,s2) (Leaf (Ident c) (Ident s) m)
  | m == Plus  && c == c1 && s == s1 = [ Leaf (Ident c2) (Ident s2) m ]
  | m == Minus && c == c2 && s == s2 = [ Leaf (Ident c1) (Ident s1) m ]
  | otherwise           = []
predicate2predicate _ _ _ = []

relation2predicate :: (String,String) -> (String,String) -> Rule
relation2predicate (c1,s1) (c2,s2)    (Branch (Ident c) m [ Leaf c' (Ident s) m', _ ])
  | m == Plus  && c == c1 && s == s1 = [ Leaf (Ident c2) (Ident s2) m' ]
  | m == Minus && c == c2 && s == s2 = [ Leaf (Ident c1) (Ident s1) m' ]
  | otherwise            = []
relation2predicate _ _ _ = []


existentialClosureE, existentialClosureX :: (String,String) -> (String,String) -> Rule
existentialClosureE = existentialClosure "somebody"
existentialClosureX = existentialClosure "something"

existentialClosure :: String -> (String,String) -> (String,String) -> Rule
existentialClosure np (c1,s1) (c2,s2) (Branch _ Plus [ Leaf (Ident c) (Ident s) Plus, _ ])
  | c == c1 && s == s1 = [ Leaf (Ident c2) (Ident s2) Plus ]
  | otherwise = []
existentialClosure np (c1,s1) (c2,s2) (Leaf (Ident c) (Ident s) Plus)
  | c == c2 && s == s2 = [ Branch (Ident c) Plus [ Leaf (Ident c1) (Ident s1) Plus, Leaf (Ident "NP") (Ident np) Plus ] ]
  | otherwise = []
existentialClosure _ _ _ _ = []


-- predicate2predicateE :: String -> String -> Rule
-- predicate2predicateE s1 s2 (Leaf (Ident s) m)
--   | m == Plus  && s == s1  = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m, Leaf (Ident "somebody") m ] ]
--   | otherwise              = []
-- predicate2predicateE _ _ _ = []
--
-- predicate2predicateX :: String -> String -> Rule
-- predicate2predicateX s1 s2 (Leaf (Ident s) m)
--   | m == Plus  && s == s1  = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m, Leaf (Ident "something") m ] ]
--   | otherwise              = []
-- predicate2predicateX _ _ _ = []

entity2type :: String -> String -> Bool -> Rule
entity2type s_e s_t unique (Leaf (Ident "NP") (Ident s) m)
  | s == s_e && unique     = [ Branch (Ident "the")  m [ Leaf (Ident "CN") (Ident s_t) m ] ]
  | s == s_e && not unique = [ Branch (Ident "some") m [ Leaf (Ident "CN") (Ident s_t) m ] ]
  | otherwise       = []
entity2type _ _ _ _ = []
