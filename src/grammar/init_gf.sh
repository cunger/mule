cd GF
gf -make -path=shared/core:shared/lexical:shared/extra:shared/chunk:domain/darts:domain/flights:task/querying:task/servicedialog ApplicationTree.gf ApplicationPL.gf ApplicationEng.gf ApplicationDut.gf ApplicationGer.gf
mv Application.pgf ../target/
