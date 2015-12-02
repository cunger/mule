module InferenceEngine 
     ( run ) where

import AbsNaturalLogic

import Data.List (nub)
import Data.String.Utils (replace)


-- TODO Understand why the two nubs are necessary...

run :: Expression -> [Expression]
run = nub . (closure applyRule rules)

closure :: (a -> b -> [b]) -> [a] -> b -> [b]
closure f as b = let bs = concat $ map (\ a -> f a b) as
                 in  if   null bs
                     then bs
                     else bs ++ (concat $ map (closure f as) bs)

applyRule :: Rule -> Expression -> [Expression]
applyRule rule tree@(Leaf   _ _)    = rule tree
applyRule rule tree@(Branch _ _ []) = rule tree
applyRule rule tree@(Branch s m ts) = nub
                                    $ filter (\ t -> not (t == tree))
                                    $ rule tree ++ map (\ xs -> Branch s m xs) (mapRule rule ts)
          where
                mapRule :: Rule -> [Expression] -> [[Expression]]
                mapRule rule ts = foldl (\ xss ys -> [ xs ++ [y] | xs <- xss, y <- ys ])
                                        [[]]
                                        (map (\ t -> t : applyRule rule t) ts)



---- RULES


type Rule = Expression -> [Expression]


rules :: [Rule]
rules =  [adjectiveUp,implicatives,factives]


-- TODO
-- NP conjunction (X conj Y ...) -> (X ... conj Y ...)

-- (CN- (A- ...) (CN- ...)) => (CN- ...)
adjectiveUp :: Rule
adjectiveUp (Branch (Ident "modify_AP_CN") Plus [ Leaf (Ident adj) m, cn ]) = [cn]
adjectiveUp _ = []

---- (CN+ ...) => (CN+ (A+ ...) (CN+ ...))
--adjectiveDown :: Rule


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