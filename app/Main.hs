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
         case (readLanguage Config.lTree, readLanguage Config.lTPTP) of
              (Just l1, Just l2) -> do putStrLn "Ready."
                                       runInputT defaultSettings $ loop (Grammar pgf l1 l2)

loop :: Grammar -> InputT IO ()
loop g = do input <- getInputLine "\n> "
            case input of
                 Nothing  -> return ()
                 Just "q" -> return ()
                 Just str -> do mapM outputStrLn $ map (prettyPrint g) (process g str)
                                loop g
