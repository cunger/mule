concrete DomainEng of Domain = SharedEng ** open SyntaxEng, ParadigmsEng in {


    lin 

        Ann   = mkNP (mkPN "Ann");
        Ed    = mkNP (mkPN "Ed");

        man   = mkCN (mkN "man" "men"); 
        happy = mkAP (mkA "happy");
        smile = mkVP (mkV "smile");
        laugh = mkVP (mkV "laugh");

        kiss  = mkV2 (mkV "kiss");

}