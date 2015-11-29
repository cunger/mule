module Translator where

import PGF

import ErrM

import AbsNaturalLogic     as NL
import ParNaturalLogic     as ParNL
import PrintNaturalLogic   as PrintNL

import AbsPredicateLogic   as PL
import ParPredicateLogic   as ParPL
import PrintPredicateLogic as PrintPL



data Grammar = Grammar { pgf  :: PGF
                       , l_nl :: Language
                       , l_pl :: Language }


ast2nl :: Grammar -> Tree -> NL.Expression
ast2nl g ast = let str = linNL g ast
               in case ParNL.pExpression $ ParNL.myLexer str of
                       Ok e -> e
                       _    -> error $ "BNFC (NaturalLogic) could not parse: " ++ str

ast2pl :: Grammar -> Tree -> PL.Expression
ast2pl g ast = let str = linPL g ast
               in case ParPL.pExpression $ ParPL.myLexer str of
                       Ok e -> e
                       _    -> error $ "BNFC (PredicateLogic) could not parse: " ++ str

nl2ast :: Grammar -> NL.Expression -> Tree
nl2ast (Grammar pgf l_nl _) e = case parse pgf l_nl (startCat pgf) (PrintNL.printTree e) of
                                     []    -> error $ "GF could not parse: " ++ PrintNL.printTree e
                                     (e:_) -> e

pl2ast :: Grammar -> PL.Expression -> Tree
pl2ast (Grammar pgf _ l_pl) e = case parse pgf l_pl (startCat pgf) (PrintPL.printTree e) of
                                     []    -> error $ "Gf could not parse: " ++ PrintPL.printTree e
                                     (e:_) -> e 

printAST :: Tree -> String
printAST = showExpr []

linNL :: Grammar -> Tree -> String
linNL g = linearize (pgf g) (l_nl g)

linPL :: Grammar -> Tree -> String
linPL g = linearize (pgf g) (l_pl g)
