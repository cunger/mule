module Main where

import qualified Config

import Translator
import Pipeline

import PGF
import System.Exit (exitSuccess,exitFailure)


main :: IO ()
main = do
         putStrLn "Loading grammar..."
         pgf    <- readPGF  Config.grammar
         case (readLanguage Config.lNaturalLogic, readLanguage Config.lPredicateLogic) of
              (Just l_nl, Just l_pl) -> do putStrLn "Ready."
                                           loop (Grammar pgf l_nl l_pl)
              _ -> exitFailure

loop :: Grammar -> IO ()
loop g = do putStrLn ""
            putStr "> "
            str <- getLine
            case str of
                 "q" -> exitSuccess
                 _   -> do mapM putStrLn $ map (prettyPrint g) (process g str)
                           loop g
