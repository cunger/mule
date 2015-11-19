module Main where

import qualified Config

import Pipeline

import PGF
import System.Exit (exitSuccess,exitFailure)


main :: IO ()
main = do
         putStrLn "Loading grammar..." 
         pgf    <- readPGF Config.grammar
         case readLanguage Config.language of 
              Just l  -> do putStrLn "Ready."
                            loop pgf l
              Nothing -> exitFailure

loop :: PGF -> Language -> IO ()
loop pgf l = do 
               putStrLn ""
               str <- getLine
               case str of 
                    "q" -> exitSuccess
                    _   -> do 
                             mapM putStrLn $ process pgf l str
                             loop pgf l
