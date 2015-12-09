abstract Core = {


    cat

        Anaphor;

        NounPhrase;
       [NounPhrase] {2};

        Predicate_CN;
        Predicate_AP;
       [Predicate_AP] {2};
        Predicate_VP;
        Predicate_Adv;
       [Predicate_Adv] {1};

        Relation_N2;
        Relation_A2;
        Relation_V2;
        Relation_Prep;

        Clause;
        Sentence;

        Text_Str;


    fun

        --------------------
        ---- Operations ----
        --------------------


        root_S   : Sentence      -> Text_Str;
        root_NP  : NounPhrase    -> Text_Str;
        root_VP  : Predicate_VP  -> Text_Str;
        root_CN  : Predicate_CN  -> Text_Str;
        root_AP  : Predicate_AP  -> Text_Str;
        root_Adv : Predicate_Adv -> Text_Str;


        ---- Application

        apply_V2     : Relation_V2   -> NounPhrase -> Predicate_VP;
        apply_N2     : Relation_N2   -> NounPhrase -> Predicate_CN;
        apply_A2     : Relation_A2   -> NounPhrase -> Predicate_AP;
        apply_Prep   : Relation_Prep -> NounPhrase -> Predicate_Adv;

        apply_VP     : NounPhrase -> Predicate_VP -> Clause;

        copula_CN_d  : Predicate_CN  -> Predicate_VP;
        copula_CN_i  : Predicate_CN  -> Predicate_VP;
        copula_AP    : Predicate_AP  -> Predicate_VP;
        copula_Adv   : Predicate_Adv -> Predicate_VP;
        copula_NP    : NounPhrase    -> Predicate_VP;


        ---- Polarity and tense

        sPosPres : Clause -> Sentence;
        sPosPast : Clause -> Sentence;
        sPosFut  : Clause -> Sentence;
        sNegPres : Clause -> Sentence;
        sNegPast : Clause -> Sentence;
        sNegFut  : Clause -> Sentence;


        ---- Modification

        modify_AP_CN  : Predicate_AP  -> Predicate_CN -> Predicate_CN;
        modify_Adv_CN : Predicate_Adv -> Predicate_CN -> Predicate_CN;
        modify_Adv_VP : Predicate_Adv -> Predicate_VP -> Predicate_VP;

        rClPosPres : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClPosPast : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClPosFut  : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClNegPres : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClNegPast : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClNegFut  : Predicate_CN -> Predicate_VP -> Predicate_CN;


        ---- Determiners

        every  : Predicate_CN -> NounPhrase;
        all    : Predicate_CN -> NounPhrase;

        someSg : Predicate_CN -> NounPhrase;
        somePl : Predicate_CN -> NounPhrase;
        an     : Predicate_CN -> NounPhrase;

        the    : Predicate_CN -> NounPhrase;

        most   : Predicate_CN -> NounPhrase;
        many   : Predicate_CN -> NounPhrase;

        no     : Predicate_CN -> Predicate_VP -> Clause;
        few    : Predicate_CN -> Predicate_VP -> Clause;


        ---- Coordination

        and_NP,  or_NP  : [NounPhrase]    -> NounPhrase;
        and_AP,  or_AP  : [Predicate_AP]  -> Predicate_AP;
        and_Adv, or_Adv : [Predicate_Adv] -> [Predicate_Adv] -> Predicate_Adv;

        and_S, or_S : Sentence -> Sentence -> Sentence;
        if_then_S   : Sentence -> Sentence -> Sentence;


        ---- Others

        Exists : Predicate_CN -> Clause;


        ---------------------
        ---- Expressions ----
        ---------------------


        somebody,  something  : NounPhrase;
        everybody, everything : NounPhrase;
        nobody,    nothing    : NounPhrase;


        ---- Anaphors

        I, We, YouSg, YouPl, He, She, It, They : Anaphor;

        anaphor : Anaphor -> NounPhrase;
        poss    : Anaphor -> Predicate_CN -> NounPhrase;

}
