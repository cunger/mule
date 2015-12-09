module InferenceEngine
     ( run ) where

import AbsNaturalLogic
import Interpretation
import Rules

import qualified Core
import qualified ScopalVerbs
------ all required domain rule sets
import qualified Darts
------

import Data.List (nub,(\\))
import Data.String.Utils (replace)


---- concatenate all imported rules sets
rules = Core.rules ++ Darts.rules 


run :: Expression -> [Expression]
run e = (closure applyRule rules e) \\ [e]

closure :: (Rule -> Expression -> [Expression]) -> [Rule] -> Expression -> [Expression]
closure f as b = step [] f as [b]
   where
   step :: [Expression] -> (Rule -> Expression -> [Expression]) -> [Rule] -> [Expression] -> [Expression]
   step done f as bs = let gen_bs = nub $ concat (map (\ b -> concat (map (\ a -> f a b) as)) bs)
                           new_bs = filter (\ b -> not (any (equiv b) (done ++ bs))) gen_bs
                       in  if   null new_bs
                           then done
                           else step (done ++ new_bs) f as new_bs

applyRule :: Rule -> Expression -> [Expression]
applyRule rule tree@(Leaf   _ _ _)  = rule tree
applyRule rule tree@(Branch _ _ []) = rule tree
applyRule rule tree@(Branch s m ts) = nub
                                    $ filter (\ t -> not (t == tree))
                                    $ rule tree ++ map (\ xs -> Branch s m xs) (mapRule rule ts)
          where
                mapRule :: Rule -> [Expression] -> [[Expression]]
                mapRule rule ts = foldl (\ xss ys -> [ xs ++ [y] | xs <- xss, y <- ys ])
                                        [[]]
                                        (map (\ t -> t : applyRule rule t) ts)
