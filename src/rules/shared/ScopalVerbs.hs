modules ScopalVerbs (rules) where

import Rules


rules = [implicatives,factives]


implicatives :: Rule
-- manage to
implicatives (Branch (Ident "manage_to") _ [vp]) = [vp]
-- forget to
implicatives (Branch (Ident s) m [ Branch i m' [ np, Branch (Ident "forget_to") _ [vp]]]) =
            [ Branch (Ident (revertPolarity s)) m [ Branch i (switch m') [ switchInTree np, vp ]] ]
-- force to
implicatives (Branch i m [ _ , Branch (Ident "force_to") _ [np,vp]]) =
            [ Branch (Ident "apply_VP") m [ np, vp ] ]
-- refuse to
implicatives (Branch (Ident s) m [ Branch i' Plus [ np, Branch (Ident "refuse_to") _ [vp]]]) =
            [ Branch (Ident (revertPolarity s)) m [ Branch i' Minus [ switchInTree np, vp ]] ]
-- attempt to
implicatives (Branch i Minus [ np, Branch (Ident "attempt_to") _ [vp]]) =
            [ Branch i Minus [ np, vp ] ]
-- hesitate to
implicatives (Branch (Ident s) m [ Branch i' Minus [ np, Branch (Ident "hesitate_to") _ [vp]]]) =
            [ Branch (Ident (revertPolarity s)) m [ Branch i' Plus [ switchInTree np, switchInTree vp ]] ]

implicatives _ = []


factives :: Rule
-- know_that
factives (Branch _ _ [ Branch _ _ [ np, Branch (Ident "know_that") _ [s] ]]) = [ setInTree Plus s ]

factives _ = []


-- AUX (switching and reverting)

switch :: Marking -> Marking
switch Plus  = Minus
switch Minus = Plus
switch None  = None

switchInTree :: Expression -> Expression
switchInTree (Leaf s m) = Leaf s (switch m)
switchInTree (Branch s m ts) = Branch s (switch m) (map switchInTree ts)

setInTree :: Marking -> Expression -> Expression
setInTree m (Leaf s _) = Leaf s m
setInTree m (Branch s _ ts) = Branch s m (map (setInTree m) ts)

revertPolarity :: String -> String
revertPolarity = replace "Pos" "Neg" . replace "Neg" "Pos"
