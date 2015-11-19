concrete DomainDut of Domain = SharedDut ** open SyntaxDut, ParadigmsDut in {


    lin 

        Ann   = mkNP (mkPN "Ann");
        Ed    = mkNP (mkPN "Ed");

        man   = mkCN (mkN "man" "mannen" de); 
        happy = mkAP (mkA "gelukkig");
        smile = mkVP (mkV "glimlachen");
        laugh = mkVP (mkV "lachen");

        kiss  = mkV2 (mkV "kussen");

}