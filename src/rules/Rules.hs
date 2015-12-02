module Rules where

import AbsNaturalLogic


type Rule = Expression -> [Expression]

relation2relation :: String -> String -> Rule
relation2relation s1 s2      (Branch (Ident "apply_V2") m [ Leaf (Ident s)  m', np ])
  | m == Plus  && s == s1 = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m', np ] ]
  | m == Minus && s == s2 = [ Branch (Ident "apply_V2") m [ Leaf (Ident s1) m', np ] ]
  | otherwise           = []
relation2relation _ _ _ = []

relation2predicate :: String -> String -> Rule
relation2predicate s1 s2   (Branch (Ident "apply_V2") m [ Leaf (Ident s) m', _ ])
  | m == Plus  && s == s1 = [ Leaf (Ident s2) m' ]
  | m == Minus && s == s2 = [ Leaf (Ident s1) m' ]
  | otherwise            = []
relation2predicate _ _ _ = []

relation2predicateE :: String -> String -> Rule
relation2predicateE s1 s2    (Branch (Ident "apply_V2") m [ Leaf (Ident s)  m', _ ])
  | m == Plus  && s == s1 = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m', Leaf (Ident "somebody") m ] ]
  | otherwise             = []
relation2predicateE _ _ _ = []

relation2predicateX  :: String -> String -> Rule
relation2predicateX  s1 s2    (Branch (Ident "apply_V2") m [ Leaf (Ident s)  m', _ ])
  | m == Plus  && s == s1  = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m', Leaf (Ident "something") m ] ]
  | otherwise              = []
relation2predicateX  _ _ _ = []

predicate2predicateE :: String -> String -> Rule
predicate2predicateE s1 s2 (Leaf (Ident s) m)
  | m == Plus  && s == s1  = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m, Leaf (Ident "somebody") m ] ]
  | otherwise              = []
predicate2predicateE _ _ _ = []

predicate2predicateX :: String -> String -> Rule
predicate2predicateX s1 s2 (Leaf (Ident s) m)
  | m == Plus  && s == s1  = [ Branch (Ident "apply_V2") m [ Leaf (Ident s2) m, Leaf (Ident "something") m ] ]
  | otherwise              = []
predicate2predicateX _ _ _ = []

modAP2modAP :: String -> String -> Rule
modAP2modAP s_ap1 s_ap2 (Branch (Ident "modify_AP_CN") m [ Leaf (Ident s)     m', cn ])
  | m == Plus  && s == s_ap1 = [ Branch (Ident "modify_AP_CN") m [ Leaf (Ident s_ap2) m', cn ] ]
  | m == Minus && s == s_ap2 = [ Branch (Ident "modify_AP_CN") m [ Leaf (Ident s_ap1) m', cn ] ]
  | otherwise        = []
modAP2modAP _ _ _    = []

modPrepNP2modPrepNP :: String -> String -> String -> Rule
modPrepNP2modPrepNP s_prep s_np1 s_np2 (Branch (Ident "apply_Prep") m [ Leaf (Ident s) m1, Leaf (Ident s1) m2 ])
  | m == Plus  && s_prep == s && s1 == s_np1 = [ Branch (Ident "apply_Prep") m [ Leaf (Ident s) m1, Leaf (Ident s_np2) m2 ] ]
  | m == Minus && s_prep == s && s1 == s_np2 = [ Branch (Ident "apply_Prep") m [ Leaf (Ident s) m1, Leaf (Ident s_np1) m2 ] ]
  | otherwise               = []
modPrepNP2modPrepNP _ _ _ _ = []

-- CN Prep NP -> AP CN
modPrepNP2modAP :: String -> String -> String -> Rule
modPrepNP2modAP s_prep s_np s_ap  (Branch (Ident "modify_Adv_CN") Plus [ Branch (Ident "apply_Prep") m' [ Leaf (Ident s1) _, Leaf (Ident s2) _ ], cn ])
  | s1 == s_prep && s2 == s_np = [ Branch (Ident "modify_AP_CN")  Plus [ Leaf (Ident s_ap) m', cn ] ]
  | otherwise                  = []
modPrepNP2modAP s_prep s_np s_ap (Branch (Ident "modify_AP_CN")  Minus [ Leaf (Ident s) m', cn ])
  | s == s_ap                 = [ Branch (Ident "modify_Adv_CN") Minus [ Branch (Ident "apply_Prep") m' [ Leaf (Ident s_prep) m', Leaf (Ident s_np) m' ], cn ] ]
  | otherwise                 = []
modPrepNP2modAP _ _ _ _       = []

-- AP CN -> CN Prep NP
modAP2modPrepNP :: String -> String -> String -> Rule
modAP2modPrepNP s_ap s_prep s_np  (Branch (Ident "modify_AP_CN")  Plus [ Leaf (Ident s) m', cn ])
  | s == s_ap                  = [ Branch (Ident "modify_Adv_CN") Plus [ Branch (Ident "apply_Prep") m' [ Leaf (Ident s_prep) m', Leaf (Ident s_np) m' ], cn ] ]
  | otherwise                  = []
modAP2modPrepNP s_ap s_prep s_np  (Branch (Ident "modify_Adv_CN") Minus [ Branch (Ident "apply_Prep") m' [ Leaf (Ident s1) _, Leaf (Ident s2) _ ], cn ])
  | s1 == s_prep && s2 == s_np = [ Branch (Ident "modify_AP_CN")  Minus [ Leaf (Ident s_ap) m', cn ] ]
  | otherwise                  = []
modAP2modPrepNP _ _ _ _        = []

entity2type :: String -> String -> Bool -> Rule
entity2type s_e s_t unique (Leaf (Ident s) m)
  | s == s_e && unique     = [ Branch (Ident "the") m [ Leaf (Ident s_t) m ] ]
  | s == s_e && not unique = [ Branch (Ident "an")  m [ Leaf (Ident s_t) m ] ]
  | otherwise       = []
entity2type _ _ _ _ = []
