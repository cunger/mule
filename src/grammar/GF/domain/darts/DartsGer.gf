concrete DartsGer of Darts = CoreGer ** open SyntaxGer, ParadigmsGer in {


    lin

        Taylor        = variants { mkNP (mkPN "Phil Taylor"); mkNP (mkPN "Taylor"); mkNP (mkPN "The Power") };
        VanGerwen     = variants { mkNP (mkPN "Michael van Gerwen"); mkNP (mkPN "van Gerwen"); mkNP (mkPN "Mighty Mike") };
        VanBarneveld  = variants { mkNP (mkPN "Raymond van Barneveld"); mkNP (mkPN "van Barneveld"); mkNP (mkPN "Barney") };
        Webster       = variants { mkNP (mkPN "Mark Webster"); mkNP (mkPN "Webster"); mkNP (mkPN "The Spider") };

        England       = mkNP (mkPN "England");
        Netherlands   = variants { mkNP the_Det (mkCN (mkN "Niederlande" feminine)); mkNP (mkPN "Holland") };
        Europe        = mkNP (mkPN "Europa");

        player        = mkCN (mkN "Spieler" "Spieler" masculine);
        match         = mkCN (mkN "Spiel" "Spiele" neuter);
        tournament    = mkCN (mkN "Turnier" "Turniere" neuter);
        worldchampion = mkCN (mkN "Weltmeister" "Weltmeister" masculine);
        worldchampionship = variants { mkCN (mkN "Weltmeisterschaft" "Weltmeisterschaften" feminine); mkCN (mkN "WM" "WMs" feminine) };

        happy     = mkAP (mkA "glücklich");
        excellent = mkAP (mkA "herausragend");
        British   = mkAP (mkA "britisch");
        Dutch     = variants { mkAP (mkA "niederländisch"); mkAP (mkA "holländisch") };
        European  = mkAP (mkA "europäisch");

        win1      = mkVP gewinnen_V;
        lose1     = mkVP verlieren_V;
        win2      = mkV2 gewinnen_V;
        lose2     = mkV2 verlieren_V;

        play_against = mkV2 (mkV "spielen") gegen_Prep;
        win_against  = mkV2 gewinnen_V  gegen_Prep;
        lose_against = mkV2 verlieren_V gegen_Prep;

        participate  = mkV2 (mkV "teil" (mkV "nehmen")) (mkPrep "an" dative);

        from = mkPrep "aus" dative;

   oper

        gewinnen_V  : V = no_geV (mkV "gewinnen" "gewinnt" "gewann" "gewänne" "gewonnen");
        verlieren_V : V = no_geV (mkV "verlieren" "verliert" "verlor" "verlöre" "verloren");
        gegen_Prep : Prep = mkPrep "gegen" accusative;
}
