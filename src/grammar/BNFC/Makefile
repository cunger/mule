all:
	happy -gca ParAST.y
	alex -g LexAST.x
	ghc --make TestAST.hs -o TestAST

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocAST.* LexAST.* ParAST.* LayoutAST.* SkelAST.* PrintAST.* TestAST.* AbsAST.* TestAST ErrM.* SharedString.* ComposOp.* AST.dtd XMLAST.* Makefile*
	

