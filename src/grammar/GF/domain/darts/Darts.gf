abstract Darts = Core ** {

    flags startcat = Text_Str;


    fun

        Taylor, VanGerwen, VanBarneveld, Webster : NounPhrase;
        England, Netherlands, Europe : NounPhrase;

        player, match, tournament, worldchampion, worldchampionship : Predicate_CN;

        happy, excellent : Predicate_AP;
        British, Dutch, European : Predicate_AP;

        win1, lose1 : Predicate_VP;
        win2, lose2 : Relation_V2;
        win_against, lose_against, play_against : Relation_V2;

        participate : Relation_V2;

        from : Relation_Prep;

}
