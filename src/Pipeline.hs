module Pipeline
     ( process
     , prettyPrint ) where

import Data.Maybe
import Data.List (nub)

import PGF

import ErrM
import AbsAST
import ParAST
import PrintAST


data Parse = Parse { language   :: Language
                   , ast        :: Expression }


process :: PGF -> String -> [String]
process pgf str = case parseAllLang pgf (startCat pgf) str of
                       ((l,ts):_) -> map (\ t -> prettyPrint pgf $ mkParse l ("(" ++ showExpr [] t ++ ")")) ts
                       _          -> []

mkParse :: Language -> String -> Parse
mkParse l str = case pExpression $ myLexer $ str of
                     Ok e -> Parse l e
                     _    -> error $ "BNFC couldn't parse: " ++ str

prettyPrint :: PGF -> Parse -> String
prettyPrint pgf (Parse l ast) = let str = printTree ast
                                in  str
                             ++ "\n"
                             ++ case readExpr str of
                                     Just t  -> linearize pgf l t
                                     Nothing -> error $ "PGF.readExpr failed for: " ++ str
                             ++ "\n"
