module Core where

import AbsNaturalLogic
import Rules

import Data.List ((\\))


rules = [stripModifiers]

-- TODO
-- NP conjunction (X conj Y ...) -> (X ... conj Y ...)
-- S conjunction

stripModifiers :: Rule
stripModifiers (Branch i Plus ts) = [ Branch i Plus (ts \\ [t]) | t <- filter isModifier ts ]
stripModifiers _ = []


-- AUX

isModifier :: Expression -> Bool
isModifier e = (ident e) `elem` ["AP","Adv"]
  where
       ident (Leaf   (Ident c) _ _) = c
       ident (Branch (Ident c) _ _) = c
