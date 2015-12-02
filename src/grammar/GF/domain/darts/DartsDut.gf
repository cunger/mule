concrete DartsDut of Darts = CoreDut ** open SyntaxDut, ParadigmsDut in {


    lin

        Taylor        = variants { mkNP (mkPN "Phil Taylor"); mkNP (mkPN "Taylor"); mkNP (mkPN "The Power") };
        VanGerwen     = variants { mkNP (mkPN "Michael van Gerwen"); mkNP (mkPN "van Gerwen"); mkNP (mkPN "Mighty Mike") };
        VanBarneveld  = variants { mkNP (mkPN "Raymond van Barneveld"); mkNP (mkPN "van Barneveld"); mkNP (mkPN "Barney") };
        Webster       = variants { mkNP (mkPN "Mark Webster"); mkNP (mkPN "Webster"); mkNP (mkPN "The Spide") };

        England       = mkNP (mkPN "Engeland");
        Netherlands   = variants { mkNP (mkPN "Nederland"); mkNP (mkPN "Holland") };
        Europe        = mkNP (mkPN "Europa");

        player        = mkCN (mkN "speler" de);
        match         = variants { mkCN (mkN "speel" het); mkCN (mkN "match" de) };
        tournament    = mkCN (mkN "toernooi" het);
        worldchampion = mkCN (mkN "wereldkampioen" het);
        worldchampionship = variants { mkCN (mkN "wereldkampionschap" het); mkCN (mkN "WK" het) };

        happy     = mkAP (mkA "gelukkig");
        excellent = variants { mkAP (mkA "uitstekend"); mkAP (mkA "voortreffelijk") };
        British   = mkAP (mkA "Brits");
        Dutch     = mkAP (mkA "Nederlands");
        European  = mkAP (mkA "Europes" "Europese");

        win1      = mkVP winnen_V;
        lose1     = mkVP verliezen_V;
        win2      = mkV2 winnen_V;
        lose2     = mkV2 verliezen_V;

        play_against = mkV2 (mkV "spelen") tegen_Prep;
        win_against  = mkV2 winnen_V  tegen_Prep;
        lose_against = mkV2 verliezen_V tegen_Prep;

        participate  = mkV2 (mkV "deel" (mkV "nemen")) (mkPrep "aan");

        from = mkPrep "uit";

    oper

        winnen_V    : V = mkV "winnen" "won" "gewonnen";
        verliezen_V : V = mkV "verliezen" "verloor" "verloren";
        tegen_Prep  : Prep = mkPrep "tegen";

}
