all:
	happy -gca ParTPTP.y
	alex -g LexTPTP.x
	ghc --make TestTPTP.hs -o TestTPTP

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocTPTP.* LexTPTP.* ParTPTP.* LayoutTPTP.* SkelTPTP.* PrintTPTP.* TestTPTP.* AbsTPTP.* TestTPTP ErrM.* SharedString.* ComposOp.* TPTP.dtd XMLTPTP.* Makefile*
	

