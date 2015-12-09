module Pipeline
     ( process
     , prettyPrint ) where

import Data.Maybe
import Data.List (nub)

import PGF

import AbsNaturalLogic (Expression)

import Config
import Translator
import Lambda
import Interpretation
import InferenceEngine


process :: Grammar -> String -> [Interpretation]
process g@(Grammar pgf _ _) str = case parseAllLang pgf (startCat pgf) str of
                                       ((l,asts):_) -> nub
                                                     $ map (\ ast -> let tree = ast2nl g ast
                                                                     in  Interpretation l tree (InferenceEngine.run tree))
                                                           asts
                                       _            -> []


prettyPrint :: Grammar -> Interpretation -> String
prettyPrint g i@(Interpretation l tree inferences) =
   toString g Nothing tree ++ foldl (++) "" (map (toString g (Just l)) inferences)

toString :: Grammar -> Maybe Language -> Expression -> String
toString g@(Grammar pgf l_nl l_pl) maybe_l tree =
       let
            ast = nl2ast g tree
       in
       case maybe_l of
            Just  l -> "\n\n--> " ++ linearize pgf l ast ++ "\n"
            Nothing -> ""
       ++
       (if Config.showAST  then "\n    " ++ printAST ast else "") ++
       (if Config.showTree then "\n    " ++ linNL g  ast else "") ++
       (if Config.showTPTP then "\n    " ++ (Lambda.run $ linPL g ast) else "") -- ++
