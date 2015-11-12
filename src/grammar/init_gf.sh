#!/bin/bash

cd GF
gf -make DomainTree.gf DomainEng.gf DomainDut.gf DomainGer.gf
mv *.pgf ../target/
