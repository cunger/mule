module ASTTest where

import ErrM
import AbsAST
import ParAST
import PrintAST

import Projection


ast1  = "(PhrUtt * $1 *)"

ast2  = "(UseCl * PPos $1)"
ast3  = "(UseCl * PNeg $1)"

  -- universal quantification ($1 = vp, $2 = cn)
ast4  = "(PredVP everybody_NP $1)"
ast5  = "(PredVP everything_NP $1)"
ast6  = "(PredVP (DetCN every_Det $2) $1)"
ast7  = "(PredVP (PredetNP all_Predet (DetCN (DetQuant IndefArt NumPl) $2)) $1)"

ast8  = "(CompCN (PredNP not_Predet (Det_CN (DetQuant IndefArt *) (UseN $1))))"
ast9  = "(UseComp (CompCN (UseN $1)))"
ast10 = "(UseComp (CompNP (DetCN (DetQuant IndefArt NumSg) (UseN $1)))"


-- Matching test

test1 = showMatch ast1 (List [Constant (Ident "PhrUtt"),Constant (Ident "NoVoc"),List [(Constant (Ident "Fnord"))],Constant (Ident "NoVoc")])

showMatch :: String -> Expression -> IO ()
showMatch str expr = case pExpression $ myLexer $ str of
                          Ok e -> case match e expr of
                                       Just m  -> putStrLn $ show m
                                       Nothing -> putStrLn "No match."
                          _    -> putStrLn $ "BNFC could not parse: " ++ str


-- Projection test

test2pos = case pExpression $ myLexer $ "(PhrUtt Blah (UseCl Blubb PPos (AnotherFunc ->)) NoVoc)" of
                Ok e -> putStrLn $ printTree $ project e
                _    -> putStrLn "parse error"

test2neg = case pExpression $ myLexer $ "(PhrUtt Blah (UseCl Blubb PNeg (AnotherFunc ->)) NoVoc)" of
                Ok e -> putStrLn $ printTree $ project e
                _    -> putStrLn "parse error"
