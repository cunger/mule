module ScopalVerbs (rules) where

import AbsNaturalLogic

import Rules
import Polarity


rules = [implicatives,factives]


implicatives :: Rule
-- manage to
implicatives (Branch (Ident "manage_to") _ [vp]) = [vp]
-- forget to
-- force to
-- refuse to
-- attempt to
-- hesitate to
implicatives _ = []


factives :: Rule
-- know_that
factives (Branch (Ident "Cl") _ [ np, Branch (Ident "know_that") _ [s] ]) = [ mark Plus s ]
factives _ = []
