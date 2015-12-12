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
        lose_V = mkV "lose" "lost" "lost";
        win_V2 = mkV2 (mkV "win" "won" "won");
        lose_V2 = mkV2 (mkV "lose" "lost" "lost");
        win_against_V2 = mkV2 (mkV "win" "won" "won") (mkPrep "against");
        lose_against_V2 = mkV2 (mkV "lose" "lost" "lost") (mkPrep "against");
        play_V = mkV "play";
        play_against_V2 = mkV2 (mkV "play") (mkPrep "against");
        participate_in_V2 = mkV2 (mkV "participate") (mkPrep "in");

}
