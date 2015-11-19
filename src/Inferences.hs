module Inferences
     ( drawInferences ) where 

import AbsTree

import Data.List (nub)
import Data.String.Utils (replace)


-- TODO Understand why the two nubs are necessary...


drawInferences :: Tree -> [Tree]
drawInferences = nub . (closure applyRule rules)

closure :: (a -> b -> [b]) -> [a] -> b -> [b]
closure f as b = let bs = concat $ map (\ a -> f a b) as
                 in  if   null bs 
                     then bs 
                     else bs ++ (concat $ map (closure f as) bs)

applyRule :: Rule -> Tree -> [Tree] 
applyRule rule tree@(Leaf   _ _)    = rule tree
applyRule rule tree@(Branch _ _ []) = rule tree
applyRule rule tree@(Branch s m ts) = nub 
                                    $ filter (\ t -> not (t == tree)) 
                                    $ rule tree ++ map (\ xs -> Branch s m xs) (mapRule rule ts)
          where 
                mapRule :: Rule -> [Tree] -> [[Tree]]
                mapRule rule ts = foldl (\ xss ys -> [ xs ++ [y] | xs <- xss, y <- ys ]) 
                                        [[]] 
                                        (map (\ t -> t : applyRule rule t) ts)
                                      


---- RULES 


type Rule = Tree -> [Tree]


rules :: [Rule] 
rules =  [implicatives,adjectiveUp]


-- TODO 
-- NP conjunction (X conj Y ...) -> (X ... conj Y ...) 


implicatives :: Rule 
-- manage to 
implicatives (Branch (Ident "manage_to") _ [vp]) = [vp]
-- forget to 
implicatives (Branch (Ident s) m [ Branch i m' [ np, Branch (Ident "forget_to") _ [vp]]]) =
            [ Branch (Ident (revertPolarity s)) m [ Branch i (switch m') [ switchInTree np, vp ]] ]
-- force to 
implicatives (Branch i m [ _ , Branch (Ident "force_to") _ [np,vp]]) =
            [ Branch i m [ Branch (Ident "cl") Plus [ np, vp ]] ]
-- refuse to 
implicatives (Branch (Ident s) m [ Branch i' Plus [ np, Branch (Ident "refuse_to") _ [vp]]]) =
            [ Branch (Ident (revertPolarity s)) m [ Branch i' Minus [ switchInTree np, vp ]] ]
-- attempt to 
implicatives (Branch i Minus [ np, Branch (Ident "attempt_to") _ [vp]]) =
            [ Branch i Minus [ np, vp ] ]
-- hesitate to 
implicatives (Branch (Ident s) m [ Branch i' Minus [ np, Branch (Ident "hesitate_to") _ [vp]]]) =
            [ Branch (Ident (revertPolarity s)) m [ Branch i' Plus [ switchInTree np, switchInTree vp ]] ]
-- and that's it
implicatives _ = []

factives :: Rule 
-- know_that
factives (Branch (Ident "know_that") _ [vp]) = [vp]

-- (CN- (A- ...) (CN- ...)) => (CN- ...)
adjectiveUp :: Rule 
adjectiveUp (Branch (Ident "modify_AP_CN") Plus [ Leaf (Ident adj) m, cn ]) = [cn]
adjectiveUp _ = []

---- (CN+ ...) => (CN+ (A+ ...) (CN+ ...))
--adjectiveDown :: Rule 


-- AUX (switching and reverting)

switch :: Marking -> Marking
switch Plus  = Minus 
switch Minus = Plus
switch None  = None

switchInTree :: Tree -> Tree 
switchInTree (Leaf s m) = Leaf s (switch m)
switchInTree (Branch s m ts) = Branch s (switch m) (map switchInTree ts)

revertPolarity :: String -> String 
revertPolarity = replace "Pos" "Neg" . replace "Neg" "Pos"
