module Projection (
       project
     , match ) where

import ErrM
import AbsAST
import ParAST
import PrintAST

import Data.List (find)
import Data.Maybe
import Data.Map (Map,(!))
import qualified Data.Map as Map


---- Projection patterns

patterns :: [(String, Map Integer Expression -> Relation)]
patterns = [ ("(PhrUtt * $1 *)",   \m -> project (m ! 1))
           , ("(UseCl * PPos $1)", \m -> project (m ! 1))
           , ("(UseCl * PNeg $1)", \m -> negation (project (m ! 1)))
          -- quantifiers ($1 = vp, $2 = cn)
          -- all
           , ("(PredVP everybody_NP $1)",  \m -> every2 (project (m ! 1)))
           , ("(PredVP everything_NP $1)", \m -> every2 (project (m ! 1)))
           , ("(PredVP (DetCN every_Det $2) $1)", \m -> reljoin (every1 (project (m ! 1))) (every2 (project (m ! 2))))
           , ("(PredVP (PredetNP all_Predet (DetCN (DetQuant IndefArt NumPl) $2)) $1)", \m -> reljoin (every1 (project (m ! 1))) (every2 (project (m ! 2))))
          -- some
          -- ...
          -- no
          -- ... 
          -- non-operator contexts (everything else)
           , ("(* $1)", \m -> project (m ! 1))
           ]


---- Projection behavior of operators

reljoin :: Relation -> Relation -> Relation
reljoin Equivalent Equivalent = Equivalent
reljoin r _ = r -- TODO

-- Negation

negation :: Relation -> Relation
negation Entails      = IsEntailedBy
negation IsEntailedBy = Entails
negation DisjointWith = Overlaps
negation Overlaps     = DisjointWith
negation relation     = relation

-- Quantifiers

every1 :: Relation -> Relation
every1 Entails      = IsEntailedBy
every1 IsEntailedBy = Entails
every1 Excludes     = DisjointWith
every1 DisjointWith = IndependentOf
every1 relation     = relation

every2 :: Relation -> Relation
every2 Excludes = DisjointWith
every2 relation = relation

-- Intersective modification


---- Machinery

project :: Expression -> Relation
project (Change r) = r
project e = case find isJust $ map (try e) patterns of
                 Just (Just r) -> r
                 Nothing       -> None

try :: Expression -> (String, Map Integer Expression -> Relation) -> Maybe Relation
try expr (str,func) = case pExpression $ myLexer $ str of
                           Ok e -> case match e expr of
                                        Just m  -> Just (func m)
                                        Nothing -> Nothing
                           _    -> Nothing

match :: Expression -> Expression -> Maybe (Map Integer Expression)
match (Constant (Ident s1)) (Constant (Ident s2))
              | s1 == s2  = Just $ Map.empty
              | otherwise = Nothing
match (Change r1) (Change r2)
              | r1 == r2  = Just $ Map.empty
              | otherwise = Nothing
match Wildcard  _         = Just $ Map.empty
match (Slot i)  e         = Just $ Map.singleton i e
match (List []) (List []) = Just $ Map.empty
match (List (e1:es1)) (List (e2:es2)) =
       case (match e1 e2, match (List es1) (List es2)) of
            (Just m, Just m') -> Just $ Map.union m m'
            _                 -> Nothing
match _ _ = Nothing
