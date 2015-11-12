#!/bin/bash

cd BNFC
bnfc -m -haskell Tree.cf
sed -i '' 's/showString "\["/showString "\[ "/' PrintTree.hs 
sed -i '' 's/showString "\]"/showString " \]"/' PrintTree.hs 
sed -i '' 's/showString ","/showString " ,"/' PrintTree.hs 
make 
