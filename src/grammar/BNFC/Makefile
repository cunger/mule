all:
	happy -gca ParTree.y
	alex -g LexTree.x
	ghc --make TestTree.hs -o TestTree

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocTree.* LexTree.* ParTree.* LayoutTree.* SkelTree.* PrintTree.* TestTree.* AbsTree.* TestTree ErrM.* SharedString.* ComposOp.* Tree.dtd XMLTree.* Makefile*
	

