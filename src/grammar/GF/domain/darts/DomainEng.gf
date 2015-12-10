concrete DomainEng of Domain = CatEng ** open ParadigmsEng in {

    lin

        player_N = mkN "player";
        match_N = mkN "match";
        game_N = mkN "game";
        tournament_N = mkN "tournament";
        worldchampion_N = mkN "world" (mkN "champion");
        worldchampionship_N = mkN "world" (mkN "championship");

        happy_A = mkA "happy";
        excellent_A = mkA "excellent";
        British_A = mkA "British";
        Dutch_A = mkA "Dutch";
        European_A = mkA "European";

        win_V = mkV "win" "won" "won";
        lose_V = mkV "lose";
        play_V = mkV "play";
        participate_V = mkV "participate";

        against_Prep = mkPrep "against";

}
