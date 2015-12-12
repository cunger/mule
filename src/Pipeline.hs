module Pipeline
     ( process
     , prettyPrint ) where

import Data.Maybe
import Data.List (nub)

import PGF

import ErrM
import ParAST
import PrintAST
import AbsAST

import InferenceEngine


data Interpretation = Interpretation { language   :: Language
                                     , ast        :: Expression
                                     , inferences :: Inferences }


process :: PGF -> String -> [String]
process pgf str = case parseAllLang pgf (startCat pgf) str of
                       ((l,ts):_) -> map (\ interpretation -> prettyPrint pgf interpretation)
                                   $ map (\ t -> let e = ast2expr t
                                                 in (Interpretation l e (InferenceEngine.run e))) ts
                       _          -> []


prettyPrint :: PGF -> Interpretation -> String
prettyPrint pgf (Interpretation l ast is) =
        "\n" ++ printTree ast ++ "\n"
        ++ foldl (++) "\n" (map (\ (e,r) -> "\n" ++ printTree r ++ " " ++ linearize pgf l (expr2ast e)) is)

ast2expr :: Tree -> Expression
ast2expr tree = let str = "(" ++ showExpr [] tree ++ ")"
                in case pExpression $ myLexer $ str of
                        Ok e -> e
                        _    -> error $ "BNFC could not parse: " ++ str

expr2ast :: Expression -> Tree
expr2ast e = let str = printTree e
             in case readExpr str of
                  Just ast -> ast
                  Nothing  -> error $ "PGF could not read: " ++ str
