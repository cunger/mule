concrete CoreTPTP of Core = {


    lincat

        Anaphor        = Str;

        NounPhrase     = NounPhraseRecord;
       [NounPhrase]    = NounPhraseRecord;

        Predicate_CN   = Str;
        Predicate_AP   = Str;
       [Predicate_AP]  = Str;
        Predicate_VP   = Str;
        Predicate_Adv  = Str;
       [Predicate_Adv] = Str;

        Relation_N2    = Str;
        Relation_A2    = Str;
        Relation_V2    = Str;
        Relation_Prep  = Str;

        Clause         = Str;
        Sentence       = Str;
        Text_Str       = Str;


    lin

        --------------------
        ---- Operations ----
        --------------------


        root_S     s = s;
        root_VP   vp = vp;
        root_CN   cn = cn;
        root_AP   ap = ap;
        root_Adv adv = adv;
        root_NP   np = np.subj;


        ---- Application

        apply_V2    r e = app e.obj r;
        apply_N2    r e = app e.obj r;
        apply_A2    r e = app e.obj r;
        apply_Prep  r e = app e.obj r;

        apply_VP    e p = app e.subj p;

        copula_CN_d p = p;
        copula_CN_i p = p;
        copula_AP   p = p;
        copula_Adv  p = app p id;
        copula_NP   e = e.subj;


        ---- Polarity and tense
        ---- (ignoring tense)

        sPosPres cl = cl;
        sPosPast cl = cl;
        sPosFut  cl = cl;
        sNegPres cl = not cl;
        sNegPast cl = not cl;
        sNegFut  cl = not cl;


        ---- Modification

        modify_AP_CN  mod p = unify mod p;
        modify_AdVCN mod p = app mod p;
        modify_AdVVP mod p = app mod p;

        rClPosPres cn vp = unify cn vp;
        rClPosPast cn vp = unify cn vp;
        rClPosFut  cn vp = unify cn vp;
        rClNegPres cn vp = unify cn vp;
        rClNegPast cn vp = unify cn vp;
        rClNegFut  cn vp = unify cn vp;


        ---- Quantification

        every  cn = forall cn;
        all    cn = forall cn;

        someSg cn = exists cn;
        somePl cn = exists cn;
        an     cn = exists cn;

        the    cn = entity (app "the" cn);


        ---- Coordination

        BasePredicate_AP  e1 e2 = unify  e1 e2;
        ConsPredicate_AP  e1 e2 = unify  e1 e2;
        BasePredicate_Adv e     = e;
        ConsPredicate_Adv e1 e2 = unify2 e1 e2;

        and_AP  e = e;
        or_AP   e = e;

        and_Adv e1 e2 = and e1 e2;
        or_Adv  e1 e2 = or  e1 e2;

        and_S   s1 s2 = and s1 s2;
        or_S    s1 s2 = or  s1 s2;

        if_then_S s1 s2 = then s1 s2;


        ---- Others

        Exists cn = "? [V1] :" ++ app cn "V1";


        ---------------------
        ---- Expressions ----
        ---------------------

        somebody   = { subj = "^ [V10] : ? [V11] : ( person (V11) & (V10 @ V11) )";
                       obj  = "^ [V10] : ^ [V12] : ? [V11] : ( person (V11) & ((V10 @ V11) @ V12) )" };
        something  = { subj = "^ [V10] : ? [V11] : (V10 @ V11)";
                       obj  = "^ [V10] : ^ [V12] : ? [V11] : ((V10 @ V11) @ V12)" };
        everybody  = { subj = "^ [V10] : ! [V11] : ( person (V11) => (V10 @ V11) )";
                       obj  = "^ [V10] : ^ [V12] : ! [V11] : ( person (V11) => ((V10 @ V11) @ V12) )" };
        everything = { subj = "^ [V10] : ! [V11] : (V10 @ V11)";
                       obj  = "^ [V10] : ^ [V12] : ! [V11] : ((V10 @ V11) @ V12)" };
        nobody     = { subj = "^ [V10] : ~ ? [V11] : ( person (V11) & (V10 @ V11) )";
                       obj  = "^ [V10] : ^ [V12] : ~ ? [V11] : ( person (V11) & ((V10 @ V11) @ V12) )" };
        nothing    = { subj = "^ [V10] : ~ ? [V11] : (V10 @ V11)";
                       obj  = "^ [V10] : ^ [V12] : ~ ? [V11] : ((V10 @ V11) @ V12)" };


        ---- Anaphors

        I     = "c_i";
        We    = "c_we";
        YouSg = "c_youSg";
        YouPl = "c_youPl";
        He    = "c_he";
        She   = "c_she";
        It    = "c_it";
        They  = "c_they";

        anaphor a   = entity a;
        poss    a p = entity (app "the" ("^ [V1] : poss(" ++ a ++ ",V1)"));


    oper

        NounPhraseRecord = { subj : Str; obj : Str };

        id : Str = "^ [V0] : V0";

        pred1  : Str -> Str = \ p -> "^ [V1] :" ++ p ++ "(V1)";
        pred2  : Str -> Str = \ p -> "^ [V2] : ^ [V1] :" ++ p ++ "(V1,V2)";
        pred3  : Str -> Str = \ p -> "^ [V3] : ^ [V2] : ^ [V1] :" ++ p ++ "(V1,V2,V3)";

        prep   : Str -> Str = \ p -> "^ [V2] : ^ [V0] : ^ [V1] : ((V0 @ V1) &" ++ p ++ "(V1,V2))";

        entity : Str -> NounPhraseRecord = \ e ->
                                  { subj = "^ [V0] : (V0 @" ++ e ++ ")";
                                    obj  = "^ [V0] : ^ [V4] : ((V0 @ " ++ e ++ ") @ V4)" };

        forall : Str -> NounPhraseRecord = \ cn ->
                                  { subj = "^ [V0] : ! [V5] : (" ++ app cn "V5" ++ "=> (V0 @ V5) )";
                                    obj  = "^ [V0] : ^ [V6] : ! [V5] : (" ++ app cn "V5" ++ "=> ((V0 @ V5) @ V6) )" };

        exists : Str -> NounPhraseRecord = \ cn ->
                                  { subj = "^ [V0] : ? [V7] : (" ++ app cn "V1" ++ "& (V0 @ V1) )";
                                    obj  = "^ [V0] : ^ [V8] : ? [V7] : (" ++ app cn "V7" ++ "& ((V0 @ V7) @ V8) )" };

        app    : Str -> Str -> Str = \ f, a -> "(" ++ f ++ "@" ++ a ++ ")";
        unify  : Str -> Str -> Str = \ p, q -> "^ [V9] : (" ++ (app p "V9") ++ "&" ++ (app q "V9") ++ ")";
        unify2 : Str -> Str -> Str = \ p, q -> "^ [V10] : ^ [V11] : (" ++ (app (app p "V10") "V11") ++ "&" ++ (app (app q "V10") "V11") ++ ")";

        and    : Str -> Str -> Str = \ e1, e2 -> "(" ++ e1 ++ "&" ++ e2 ++ ")";
        or     : Str -> Str -> Str = \ e1, e2 -> "(" ++ e1 ++ "|"  ++ e2 ++ ")";
        then   : Str -> Str -> Str = \ e1, e2 -> "(" ++ e1 ++ "=>"  ++ e2 ++ ")";

        not    : Str -> Str = \ e -> "~" ++ e;

}
