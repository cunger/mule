all:
	happy -gca ParNaturalLogic.y
	alex -g LexNaturalLogic.x
	ghc --make TestNaturalLogic.hs -o TestNaturalLogic

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocNaturalLogic.* LexNaturalLogic.* ParNaturalLogic.* LayoutNaturalLogic.* SkelNaturalLogic.* PrintNaturalLogic.* TestNaturalLogic.* AbsNaturalLogic.* TestNaturalLogic ErrM.* SharedString.* ComposOp.* NaturalLogic.dtd XMLNaturalLogic.* Makefile*
	

