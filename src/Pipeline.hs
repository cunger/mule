module Pipeline
     ( process
     , prettyPrint ) where

import PGF

import Translator

import Lambda
import InferenceEngine


data Interpretation = Interpretation { language :: Language
                                     , ast :: Tree
                                     , inferences :: [Tree] }
                      deriving (Eq,Show)


process :: Grammar -> String -> [Interpretation]
process g@(Grammar pgf _ _) str = case parseAllLang pgf (startCat pgf) str of
                                       ((l,ts):_) -> map (\ t -> Interpretation l t (drawInferences g t)) ts
                                       _          -> []

drawInferences :: Grammar -> Tree -> [Tree]
drawInferences g t = let tree  = ast2nl g t
                         trees = InferenceEngine.run tree
                     in  map (nl2ast g) trees


prettyPrint :: Grammar -> Interpretation -> String
prettyPrint g@(Grammar pgf l_nl l_pl) i@(Interpretation l ast inferences) =
--  "\n  " ++ printAST ast ++
    "\n  " ++ linNL g ast ++
--  "\n  " ++ linPL g ast ++
    "\n  " ++ (Lambda.run $ linPL g ast) ++
    "\n  " ++ foldl (++) "" (map (prettyPrintInference g l) inferences)
  where
    prettyPrintInference g l ast = "\n --> " ++ linearize pgf l ast
                                ++ "\n     " ++ linNL g ast
                                ++ "\n     " ++ (Lambda.run $ linPL g ast)
                                ++ "\n"
