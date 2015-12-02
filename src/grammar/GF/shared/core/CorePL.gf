concrete CorePL of Core = open Prelude in {


    lincat

        Anaphor       = Str;

        NounPhrase    = NounPhraseRecord;
        [NounPhrase]  = NounPhraseRecord;

        Predicate_CN  = Str;
        Predicate_AP  = Str;
        Predicate_VP  = Str;
        Predicate_Adv = Str;

        Relation_N2   = Str;
        Relation_A2   = Str;
        Relation_V2   = Str;
        Relation_Prep = Str;

        Clause        = Str;
        Sentence      = Str;
        Text_Str      = Str;


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
        copula_Adv  p = p;
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
        modify_Adv_CN mod p = unify mod p;
        modify_Adv_VP mod p = unify mod p;

        rClPosPres cn vp = unify cn vp;
        rClPosPast cn vp = unify cn vp;
        rClPosFut  cn vp = unify cn vp;
        rClNegPres cn vp = unify cn vp;
        rClNegPast cn vp = unify cn vp;
        rClNegFut  cn vp = unify cn vp;


        ---- Quantification

        every  cn = gquant "all"  cn;
        all    cn = gquant "all"  cn;

        someSg cn = gquant "some" cn;
        somePl cn = gquant "some" cn;
        an     cn = gquant "some" cn;

        the    cn = entity (app "the" cn);
        most   cn = gquant "most" cn;
        many   cn = gquant "many" cn;

        no  cn vp = app (gquant "no"  cn).subj vp;
        few cn vp = app (gquant "few" cn).subj vp;


        ---- Coordination

--      BaseNounPhrase e1 e2 = e1 ++ e2;
--      ConsNounPhrase e1 e2 = e1 ++ e2;

--      and_NP e = app "sum" e;
--      or_NP  e = app "union" e;

        and_S s1 s2 = and s1 s2;
        or_S  s1 s2 = or  s1 s2;

        if_then_S s1 s2 = then s1 s2;


        ---- Others

        Exists cn = "exists x [ top ] [" ++ app cn "x" ++ "]";


        ---------------------
        ---- Expressions ----
        ---------------------

        somebody  = { subj = "lambda P some x [ person (x) ] [ (P @ x) ]";
                      obj  = "lambda R lambda y some x [ person (x) ] [ ((R @ x) @ y) ]" };
        something = { subj = "lambda P some x [ top ] [ (P @ x) ]";
                      obj  = "lambda R lambda y some x [ top ] [ ((R @ x) @ y) ]" };

        ---- Anaphors

        I     = "v_i";
        We    = "v_we";
        YouSg = "v_youSg";
        YouPl = "v_youPl";
        He    = "v_he";
        She   = "v_she";
        It    = "v_it";
        They  = "v_they";

        anaphor a   = entity a;
--      poss    a p = a ++ ":" ++ (app p a);


    oper

        NounPhraseRecord = { subj : Str; obj : Str };

        pred1  : Str -> Str = \ p -> "lambda x" ++ p ++ "(x)";
        pred2  : Str -> Str = \ p -> "lambda y lambda x" ++ p ++ "(x,y)";
        pred3  : Str -> Str = \ p -> "lambda z lambda y lambda x" ++ p ++ "(x,y,z)";

        entity : Str -> NounPhraseRecord = \ e ->
                                  { subj = "lambda P (P @" ++ e ++ ")";
                                    obj  = "lambda R lambda y ((R @ " ++ e ++ ") @ y)" };

        gquant : Str -> Str -> NounPhraseRecord = \ q, cn ->
                                  { subj = "lambda P" ++ q ++ "x [" ++ app cn "x" ++ "] [ (P @ x) ]";
                                    obj  = "lambda R lambda y" ++ q ++ "x [" ++ app cn "x" ++ "] [ ((R @ x) @ y) ]" };

        app    : Str -> Str -> Str = \ f, a -> "(" ++ f ++ "@" ++ a ++ ")";
        unify  : Str -> Str -> Str = \ p, q -> "lambda v (" ++ (app p "v") ++ "and" ++ (app q "v") ++ ")";

        and    : Str -> Str -> Str = \ e1, e2 -> "(" ++ e1 ++ "and" ++ e2 ++ ")";
        or     : Str -> Str -> Str = \ e1, e2 -> "(" ++ e1 ++ "or"  ++ e2 ++ ")";
        then   : Str -> Str -> Str = \ e1, e2 -> "(" ++ e1 ++ "->"  ++ e2 ++ ")";

        not    : Str -> Str = \ e -> "not" ++ e;

}
