cd BNFC

cd NaturalLogic
bnfc -m -haskell NaturalLogic.cf
sed -i '' 's/showString "\["/showString "\[ "/' PrintNaturalLogic.hs
sed -i '' 's/showString "\]"/showString " \]"/' PrintNaturalLogic.hs
sed -i '' 's/showString ","/showString " ,"/'   PrintNaturalLogic.hs
make

cd ../PredicateLogic
bnfc -m -haskell PredicateLogic.cf
make
