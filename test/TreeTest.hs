module TreeTest where

import AbsNaturalLogic
import Interpretation

main :: IO ()
main = equivTest

equivTest :: IO ()
equivTest = do putStrLn $ show $ equiv t1 t2
               putStrLn $ show $ equiv t2 t3
               putStrLn $ show $ equiv t4 t3

t1,t2,t3,t4 :: Expression
t1 = Branch (Ident "root") Plus [Branch (Ident "NP") Plus [Leaf (Ident "CN") (Ident "t1") Plus,Leaf (Ident "CN") (Ident "t2") Plus]]
t2 = Branch (Ident "root") Plus [Branch (Ident "NP") Plus [Leaf (Ident "CN") (Ident "t2") Plus,Leaf (Ident "CN") (Ident "t1") Plus]]
t3 = Branch (Ident "root") Plus [Branch (Ident "NP") Plus [Leaf (Ident "CN") (Ident "t1") Plus]]
t4 = Branch (Ident "root") Plus [Branch (Ident "NP") Plus [Leaf (Ident "CN") (Ident "t1") Plus,Leaf (Ident "CN") (Ident "t2") Plus,Leaf (Ident "CN") (Ident "t3") Plus]]
