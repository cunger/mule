module Main where

import qualified Config

import Translator
import Pipeline

import PGF
import System.Console.Haskeline
import System.Exit (exitFailure)


main :: IO ()
main = do
         putStrLn "Loading grammar..."
         pgf    <- readPGF  Config.grammar
         case (readLanguage Config.lNaturalLogic, readLanguage Config.lPredicateLogic) of
              (Just l_nl, Just l_pl) -> do putStrLn "Ready."
                                           runInputT defaultSettings $ loop (Grammar pgf l_nl l_pl)
              _ -> exitFailure

loop :: Grammar -> InputT IO ()
loop g = do input <- getInputLine "> "
            case input of
                 Nothing  -> return ()
                 Just "q" -> return ()
                 Just str -> do outputStrLn ""
                                mapM outputStrLn $ map (prettyPrint g) (process g str)
                                loop g
