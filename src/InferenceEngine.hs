module InferenceEngine (Inferences,run) where

import Data.Maybe
import Data.Map  (Map,(!))
import Data.List (nub,(\\))

import ErrM
import AbsAST
import ParAST

import Projection
-- import rule sets
import qualified Structural
import qualified ScopalVerbs
import qualified Darts


------------------------------------------------------------
rules = Structural.rules ++ ScopalVerbs.rules ++ Darts.rules
------------------------------------------------------------


type Inferences = [(Expression,Relation)]

run :: Expression -> Inferences
run e = filter (\ (e',r) -> not (r == None || e' == e))
      $ closure applyRule rules e

closure :: (String -> Expression -> Inferences) -> [String] -> Expression -> Inferences
closure f rs e = step [] f rs [e]
    where
         step :: Inferences -> (String -> Expression -> Inferences) -> [String] -> [Expression] -> Inferences
         step done f rs es = let gen_infs = nub $ concat (map (\ e -> concat (map (\ r -> f r e) rs)) es)
                                 old_es   = [ e | (e,_) <- done ] ++ es
                                 new_infs = filter (\ (e,_) -> not (any (== e) old_es)) gen_infs
                             in  if   null new_infs
                                 then done
                                 else step (done ++ new_infs) f rs [ e | (e,_) <- new_infs ]

applyRule :: String -> Expression -> Inferences
applyRule str e = case pEdit $ myLexer $ str of
                       Ok ed -> case edit [] ed e of
                                     Just z  -> [unwind z]
                                     Nothing -> []
                       _     -> []


---- Zipper -------------------------------------------

data Context = Hole
             | CList [Expression] Context [Expression]

type Thread  = [Context]

data Zipper  = Zip Expression Expression Thread
--------------------------------------------------------

edit :: Thread -> Edit -> Expression -> Maybe Zipper
edit thread s@(Rewrite e1 r e2) e@(List es) =
            case match e1 e of
                 Just m  -> Just $ Zip (eval m e2) (Change r) (Hole:thread)
                 Nothing -> mapedit ((CList [] Hole []):thread) s es
edit thread s@(Rewrite e1 r e2) e =
            case match e1 e of
                 Just m  -> Just $ Zip (eval m e2) (Change r) (Hole:thread)
                 Nothing -> Nothing

mapedit :: Thread -> Edit -> [Expression] -> Maybe Zipper
mapedit ((CList left Hole right):cs) s@(Rewrite e1 r e2) (e:es) =
   case edit cs s e of
        Just (Zip e' r' thread') -> Just (Zip e' r' (thread'++[CList left Hole (right++es)]))
        Nothing                  -> mapedit ((CList (left++[e]) Hole right):cs) s es
mapedit c s [] = Nothing

eval :: Map Integer Expression -> Expression -> Expression
eval m (Slot i)  = m ! i
eval m (List es) = List (map (eval m) es)
eval _ e         = e

unwind :: Zipper -> (Expression,Relation)
unwind (Zip e r []) = (e,project r)
unwind (Zip e r (Hole:cs)) = unwind (Zip e r cs)
unwind (Zip e r ((CList left Hole right):cs)) = unwind (Zip (List (left++[e]++right)) (List (left++[r]++right)) cs)
