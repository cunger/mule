module InferenceTest where

import ErrM
import ParAST
import PrintAST

import InferenceEngine


parse_some   = "(PhrUtt NoPConj (UttS (UseCl (TTAnt TPast ASimul) PPos (PredVP (DetCN someSg_Det (AdjCN (PositA Dutch_A) (UseN player_N))) (ComplSlash (SlashV2a lose_against_V2) (UsePN PhilTaylor_PN))))) NoVoc)"
parse_every1 = "(PhrUtt NoPConj (UttS (UseCl (TTAnt TPast ASimul) PPos (PredVP (DetCN every_Det (AdjCN (PositA Dutch_A) (UseN player_N))) (ComplSlash (SlashV2a lose_against_V2) (UsePN PhilTaylor_PN))))) NoVoc)"
parse_every2 = "(PhrUtt NoPConj (UttS (UseCl (TTAnt TPast ASimul) PPos (PredVP (DetCN every_Det (AdjCN (PositA Dutch_A) (UseN player_N))) (ComplSlash (SlashV2a play_against_V2) (UsePN PhilTaylor_PN))))) NoVoc)"

test :: String -> IO ()
test s = case pExpression $ myLexer $ s of
            Ok e -> putStrLn $ foldl (++) "" $ map (\ (e,r) -> "\n" ++ printTree r ++ " " ++ printTree e)
                             $ InferenceEngine.run e
            _    -> putStrLn "Möp!"
