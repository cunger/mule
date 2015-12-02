concrete DartsEng of Darts = CoreEng ** open SyntaxEng, ParadigmsEng in {


    lin

        Taylor        = variants { mkNP (mkPN "Phil Taylor"); mkNP (mkPN "Taylor"); mkNP (mkPN "The Power") };
        VanGerwen     = variants { mkNP (mkPN "Michael van Gerwen"); mkNP (mkPN "van Gerwen"); mkNP (mkPN "Mighty Mike") };
        VanBarneveld  = variants { mkNP (mkPN "Raymond van Barneveld"); mkNP (mkPN "van Barneveld"); mkNP (mkPN "Barney") };
        Webster       = variants { mkNP (mkPN "Mark Webster"); mkNP (mkPN "Webster"); mkNP (mkPN "The Spider") };

        England       = mkNP (mkPN "England");
        Netherlands   = variants { mkNP (mkPN "the Netherlands"); mkNP (mkPN "Holland") };
        Europe        = mkNP (mkPN "Europe");

        player        = mkCN (mkN "player");
        match         = variants { mkCN (mkN "match"); mkCN (mkN "game") };
        tournament    = mkCN (mkN "tournament");
        worldchampion = mkCN (mkN "world champion");
        worldchampionship = mkCN (mkN "world championship");

        happy     = mkAP (mkA "happy");
        excellent = mkAP (mkA "excellent");
        British   = mkAP (mkA "British");
        Dutch     = mkAP (mkA "Dutch");
        European  = mkAP (mkA "European");

        win1      = mkVP win_V;
        lose1     = mkVP lose_V;
        win2      = mkV2 win_V;
        lose2     = mkV2 lose_V;

        play_against = mkV2 (mkV "play") against_Prep;
        win_against  = mkV2 win_V against_Prep;
        lose_against = mkV2 lose_V against_Prep;

        participate  = mkV2 (mkV "participate") in_Prep;

        from = mkPrep "from";

    oper

        win_V  : V = mkV "win" "won" "won";
        lose_V : V = mkV "lose" "lost" "lost";
        against_Prep : Prep = mkPrep "against";

}
