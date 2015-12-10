module Main where

import qualified Config

import Pipeline

import PGF
import System.Console.Haskeline
import System.Exit (exitFailure)


main :: IO ()
main = do
         putStrLn "Loading grammar..."
         pgf    <- readPGF Config.grammar
         do putStrLn "Ready."
            runInputT defaultSettings $ loop pgf

loop :: PGF -> InputT IO ()
loop pgf = do input <- getInputLine "\n> "
              case input of
                   Nothing  -> return ()
                   Just "q" -> return ()
                   Just str -> do mapM outputStrLn $ process pgf str
                                  loop pgf
