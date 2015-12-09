cd BNFC

cd NaturalLogic
bnfc -m -haskell NaturalLogic.cf
sed -i '' 's/showString "\["/showString "\[ "/' PrintNaturalLogic.hs
sed -i '' 's/showString "\]"/showString " \]"/' PrintNaturalLogic.hs
sed -i '' 's/showString ","/showString " ,"/'   PrintNaturalLogic.hs
make

cd ../TPTP
bnfc -m -haskell TPTP.cf
make
