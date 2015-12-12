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
          -- Negation
           , ("(UseCl * PNeg $1)", \m -> negation (project (m ! 1)))
          -- Intersective modification
           , ("(AdjCN * $1)",      \m -> intersect (project (m ! 1)))
          -- Quantifiers
           ]
             ++ quantifier_patterns "every"
             ++ quantifier_patterns "some"
             ++ quantifier_patterns "no"
             ++
           [ ("(PredetNP not_Predet (DetCN every_Det $1) $2)", \m -> reljoin (negation (restr "every" (project (m ! 1))))
                                                                             (negation (scope "every" (project (m ! 2)))))
           , ("(PredetNP not_Predet (PredetNP all_Predet (DetCN (DetQuant IndefArt NumPl) $1)) $2)",
                                                               \m -> reljoin (restr "every" (project (m ! 1)))
                                                                             (restr "every" (project (m ! 2))))
           , ("(ComplSlash $2 (PredetNP all_Predet (DetCN (DetQuant IndefArt NumPl) $1)))",
                                                                \m -> reljoin (restr "every" (project (m ! 1)))
                                                                              (restr "every" (project (m ! 2))))
          -- TODO some verbs are not upward-monotone 
          -- , ("(ComplSlash * $1)", \m -> ...)
          -- non-operator contexts (everything else)
           , ("(* $1)", \m -> project (m ! 1))
           , ("(* $1 $2)", \m -> reljoin (project (m ! 1)) (project (m ! 2)))
           ]

quantifier_patterns s = [
          -- subject position
            ("(PredVP "++s++"body_NP $2)",  \m -> scope s (project (m ! 2)))
          , ("(PredVP "++s++"thing_NP $2)", \m -> scope s (project (m ! 2)))
          , ("(PredVP (DetCN "++s++"_Det $1) $2)", \m -> reljoin (restr s (project (m ! 1))) (scope s (project (m ! 2))))
          -- object position
          , ("(ComplSlash $2 "++s++"body_NP)",  \m -> scope s (project (m ! 2)))
          , ("(ComplSlash $2 "++s++"thing_NP)", \m -> scope s (project (m ! 2)))
          , ("(ComplSlash $2 (DetCN "++s++"_Det $1))", \m -> reljoin (restr s (project (m ! 1))) (scope s (project (m ! 2))))
          ]

---- Projection behavior of operators

reljoin :: Relation -> Relation -> Relation
reljoin Equivalent    r             = r
reljoin r             Equivalent    = r
reljoin Entails       Entails       = Entails
reljoin Entails       Excludes      = DisjointWith
reljoin Entails       DisjointWith  = DisjointWith
reljoin IsEntailedBy  IsEntailedBy  = IsEntailedBy
reljoin IsEntailedBy  Excludes      = Overlaps
reljoin IsEntailedBy  Overlaps      = Overlaps
reljoin Excludes      Entails       = Overlaps
reljoin Excludes      IsEntailedBy  = DisjointWith
reljoin Excludes      Excludes      = Equivalent
reljoin Excludes      DisjointWith  = IsEntailedBy
reljoin Excludes      Overlaps      = Entails
reljoin Excludes      IndependentOf = IndependentOf
reljoin DisjointWith  IsEntailedBy  = DisjointWith
reljoin DisjointWith  Excludes      = Entails
reljoin DisjointWith  Overlaps      = Entails
reljoin Overlaps      Entails       = Overlaps
reljoin Overlaps      Excludes      = IsEntailedBy
reljoin Overlaps      DisjointWith  = IsEntailedBy
reljoin IndependentOf Excludes      = IndependentOf
-- the rest
reljoin r None = r
reljoin None r = r
reljoin _ _    = None

-- Negation

negation :: Relation -> Relation
negation Entails      = IsEntailedBy
negation IsEntailedBy = Entails
negation DisjointWith = Overlaps
negation Overlaps     = DisjointWith
negation relation     = relation

-- Intersective modification

intersect :: Relation -> Relation
intersect Excludes = DisjointWith
intersect Overlaps = IndependentOf
intersect relation = relation

-- Quantifiers

restr :: String -> Relation -> Relation
restr "every" Entails      = IsEntailedBy
restr "every" IsEntailedBy = Entails
restr "every" Excludes     = DisjointWith
restr "every" DisjointWith = IndependentOf
restr "every" Overlaps     = DisjointWith
restr "every" relation     = relation
restr "some"  Excludes     = Overlaps
restr "some"  DisjointWith = IndependentOf
restr "some"  relation     = relation
restr "no"    relation     = negation (restr "some" relation)

scope :: String -> Relation -> Relation
scope "every" Excludes     = DisjointWith
scope "every" Overlaps     = IndependentOf
scope "every" relation     = relation
scope "some"  Excludes     = Overlaps
scope "some"  DisjointWith = IndependentOf
scope "some"  relation     = relation
scope "no"    relation     = negation (scope "some" relation)

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
