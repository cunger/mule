concrete DomainGer of Domain = CatGer ** open ParadigmsGer in {

    lin

        player_N = mkN "Spieler" "Spieler" masculine;
        game_N = mkN "Spiel" "Spiele" neuter;
        tournament_N = mkN "Turnier" "Turniere" neuter;
        worldchampion_N = mkN "Weltmeister" "Weltmeister" masculine;
        worldchampionship_N = mkN "Weltmeisterschaft" "Weltmeisterschaften" feminine;

        happy_A = mkA "glücklich";
        excellent_A = mkA "hervorragend";
        British_A = mkA "britisch";
        Dutch_A = variants { mkA "niederländisch"; mkA "holländisch" };
        European_A = mkA "europäisch";

        win_V = gewinnen_V;
        lose_V = verlieren_V;
        win_V2 = mkV2 gewinnen_V;
        lose_V2 = mkV2 verlieren_V;
        win_against_V2 = mkV2 gewinnen_V gegen_Prep;
        lose_against_V2 = mkV2 verlieren_V gegen_Prep;
        play_V = mkV "spielen";
        play_against_V2 = mkV2 (mkV "spielen") gegen_Prep;
        participate_in_V2 = mkV2 (mkV "teil" (mkV "nehmen" "nimmt" "nahm" "nähme" "genommen")) (mkPrep "an" dative);

    oper

        gewinnen_V  : V = mkV "gewinnen" "gewinnt" "gewonnen" "gewänne" "gewonnen";
        verlieren_V : V = mkV "verlieren" "verliert" "verloren" "verliere" "verloren";

        gegen_Prep : Prep = mkPrep "gegen" accusative;
}
