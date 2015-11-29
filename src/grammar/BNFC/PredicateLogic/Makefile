all:
	happy -gca ParPredicateLogic.y
	alex -g LexPredicateLogic.x
	ghc --make TestPredicateLogic.hs -o TestPredicateLogic

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocPredicateLogic.* LexPredicateLogic.* ParPredicateLogic.* LayoutPredicateLogic.* SkelPredicateLogic.* PrintPredicateLogic.* TestPredicateLogic.* AbsPredicateLogic.* TestPredicateLogic ErrM.* SharedString.* ComposOp.* PredicateLogic.dtd XMLPredicateLogic.* Makefile*
	

