module Core where

import AbsNaturalLogic
import Rules


rules = [adjectiveUp]


-- TODO
-- NP conjunction (X conj Y ...) -> (X ... conj Y ...)

-- (CN- (A- ...) (CN- ...)) => (CN- ...)
adjectiveUp :: Rule
adjectiveUp (Branch (Ident "modify_AP_CN") Plus [ Leaf (Ident adj) m, cn ]) = [cn]
adjectiveUp _ = []

---- (CN+ ...) => (CN+ (A+ ...) (CN+ ...))
--adjectiveDown :: Rule
