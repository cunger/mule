incomplete concrete CoreI of Core = open Syntax in {


    lincat

        Anaphor        = Pron;

        NounPhrase     = NP;
       [NounPhrase]    = [NP];

        Predicate_CN   = CN;
        Predicate_AP   = AP;
       [Predicate_AP]  = [AP];
        Predicate_VP   = VP;
        Predicate_Adv  = Adv;
       [Predicate_Adv] = Adv;

        Relation_N2    = N2;
        Relation_A2    = A2;
        Relation_V2    = V2;
        Relation_Prep  = Prep;

        Clause         = Cl;
        Sentence       = S;
        Text_Str       = Str;


    lin

        --------------------
        ---- Operations ----
        --------------------


        root_S     s = (mkUtt s).s;
        root_NP   np = (mkUtt np).s;
        root_VP   vp = (mkUtt vp).s;
        root_CN   cn = (mkUtt cn).s;
        root_AP   ap = (mkUtt ap).s;
        root_Adv adv = (mkUtt adv).s;


        ---- Application

        apply_V2    r e = mkVP  r e;
        apply_N2    r e = mkCN  r e;
        apply_A2    r e = mkAP  r e;
        apply_Prep  r e = mkAdv r e;

        apply_VP    e p = mkCl e p;

        copula_CN_d p = mkVP (mkNP the_Det p);
        copula_CN_i p = mkVP (mkNP a_Det p);
        copula_AP   p = mkVP p;
        copula_Adv  p = mkVP p;
        copula_NP   e = mkVP e;


        ---- Polarity and tense

        sPosPres cl = mkS presentTense positivePol cl;
        sPosPast cl = mkS pastTense    positivePol cl;
        sPosFut  cl = mkS futureTense  positivePol cl;
        sNegPres cl = mkS presentTense negativePol cl;
        sNegPast cl = mkS pastTense    negativePol cl;
        sNegFut  cl = mkS futureTense  negativePol cl;


        ---- Modification

        modify_AP_CN  mod p = mkCN mod p;
        modify_Adv_CN mod p = mkCN p mod;
        modify_Adv_VP mod p = mkVP p mod;

        rClPosPres cn vp = mkCN cn (mkRS presentTense positivePol (mkRCl which_RP vp));
        rClPosPast cn vp = mkCN cn (mkRS pastTense    positivePol (mkRCl which_RP vp));
        rClPosFut  cn vp = mkCN cn (mkRS futureTense  positivePol (mkRCl which_RP vp));
        rClNegPres cn vp = mkCN cn (mkRS presentTense negativePol (mkRCl which_RP vp));
        rClNegPast cn vp = mkCN cn (mkRS pastTense    negativePol (mkRCl which_RP vp));
        rClNegFut  cn vp = mkCN cn (mkRS futureTense  negativePol (mkRCl which_RP vp));


        ---- Determiners

        every  cn = mkNP every_Det  cn;
        all    cn = mkNP all_Predet (mkNP aPl_Det cn);

        someSg cn = mkNP someSg_Det cn;
        somePl cn = mkNP somePl_Det cn;
        an     cn = mkNP aSg_Det    cn;

        the    cn = mkNP the_Det    cn;

        most   cn = mkNP most_Predet (mkNP aPl_Det cn);
        many   cn = mkNP many_Det cn;

        no     cn vp = mkCl (mkNP (mkDet no_Quant) cn) vp;
        few    cn vp = mkCl (mkNP few_Det cn) vp;


        ---- Coordination

        BaseNounPhrase    e1 e2 = mkListNP  e1 e2;
        ConsNounPhrase    e1 e2 = mkListNP  e1 e2;
        BasePredicate_AP  e1 e2 = mkListAP  e1 e2;
        ConsPredicate_AP  e1 e2 = mkListAP  e1 e2;
        BasePredicate_Adv e     = e;
        ConsPredicate_Adv e1 e2 = lin Adv { s = e1.s ++ e2.s };

        and_NP  e = mkNP  and_Conj e;
        or_NP   e = mkNP  or_Conj  e;
        and_AP  e = mkAP  and_Conj e;
        or_AP   e = mkAP  or_Conj  e;

        and_Adv e1 e2 = mkAdv and_Conj e1 e2;
        or_Adv  e1 e2 = mkAdv or_Conj  e1 e2;

        and_S   s1 s2 = mkS and_Conj s1 s2;
        or_S    s1 s2 = mkS or_Conj  s1 s2;

        if_then_S s1 s2 = mkS if_then_Conj s1 s2;


        ---- Others

        Exists cn = mkCl cn;


        ---------------------
        ---- Expressions ----
        ---------------------


        somebody   = somebody_NP;
        something  = something_NP;
        everybody  = everybody_NP;
        everything = everything_NP;
        nobody     = nobody_NP;
        nothing    = nothing_NP;


        ---- Anaphors

        I     = i_Pron;
        We    = we_Pron;
        YouSg = youSg_Pron;
        YouPl = youPl_Pron;
        He    = he_Pron;
        She   = she_Pron;
        It    = it_Pron;
        They  = they_Pron;

        anaphor a   = mkNP a;
        poss    a p = mkNP a p;

}
