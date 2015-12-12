concrete DomainDut of Domain = CatDut ** open ParadigmsDut, IrregDut in {

    lin

        player_N = mkN "speler" de;
        game_N = mkN "speel" het;
        tournament_N = mkN "toernooi" het;
        worldchampion_N = mkN "wereldkampioen" de);
        worldchampionship_N = variants { mkN "wereldkampionschap" het; mkN "WK" het };

        happy_A = mkA "gelukkig";
        excellent_A = mkA "uitstekend";
        British_A = mkA "Britse";
        Dutch_A = mkA "Nederlands";
        European_A = mkA "Europes";

        win_V = winnen_V;
        lose_V = verliezen_V;
        win_V2 = mkV2 winnen_V;
        lose_V2 = mkV2 verliezen_V;
        win_against_V2 = mkV2 winnen_V tegen_Prep;
        lose_against_V2 = mkV2 verliezen_V tegen_Prep;
        play_V = mkV "spelen";
        play_against_V2 = mkV2 (mkV "spelen") tegen_Prep;
        participate_in_V2 = mkV2 (mkV "deel" nemen_V) (mkPrep "aan");

    oper

        tegen_Prep : Prep = mkPrep "tegen";
}
