module InferenceEngine
     ( run ) where

import AbsNaturalLogic
import Rules

import qualified Core
--import qualified ScopalVerbs
------ all required domain rule sets
import qualified Darts
------

import Data.List (nub)
import Data.String.Utils (replace)


---- concatenate all imported rules sets
rules = Core.rules ++ Darts.rules


run :: Expression -> [Expression]
run e = closure [e] applyRule rules [e]

-- here: a = Rule, b = Expression
closure :: Eq b => [b] -> (a -> b -> [b]) -> [a] -> [b] -> [b]
closure done f as bs = let gen_bs = nub $ concat (map (\ b -> concat (map (\ a -> f a b) as)) bs)
                           new_bs = filter (not . (`elem` done)) gen_bs
                       in  if   null new_bs
                           then done
                           else closure (done ++ new_bs) f as new_bs

-- TODO Why does initial [b] end up in result?

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
