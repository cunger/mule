concrete CorePL of Core = open Prelude in {


    param ApplicationDirection = NP2VP | VP2NP;


    lincat

        Anaphor_Pron  = Str;

        Entity_NP     = Str;
        [Entity_NP]   = Str;

        Predicate_CN  = Str;
        Predicate_AP  = Str;
        Predicate_VP  = Str;
        Predicate_Adv = Str;

        Relation_N2   = Str;
        Relation_A2   = Str;
        Relation_V2   = Str;
        Relation_Prep = Str;

        Clause_Cl     = Clause;
        Sentence_S    = Str;
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
        root_NP   np = np;


        ---- Application

        apply_V2    r e = app r e;
        apply_N2    r e = app r e;
        apply_A2    r e = app r e;
        apply_Prep  r e = app r e;

        apply_VP    e p = { np = e; vp = p; appdir = VP2NP };

        copula_CN_d p = p;
        copula_CN_i p = p;
        copula_AP   p = p;
        copula_Adv  p = p;
        copula_NP   e = e;


        ---- Polarity and tense

        sPosPres cl = appcl cl;
        sPosPast cl = "time=past :"   ++ appcl cl;
        sPosFut  cl = "time=future :" ++ appcl cl;
        sNegPres cl = appcl (notcl cl);
        sNegPast cl = "time=past :"   ++ appcl (notcl cl);
        sNegFut  cl = "time=future :" ++ appcl (notcl cl);


        ---- Modification

        modify_AP_CN  mod p = unify mod p;
        modify_Adv_VP mod p = unify mod p;

        rClPosPres cn vp = unify cn vp;
        rClPosPast cn vp = unify cn vp;
        rClPosFut  cn vp = unify cn vp;
        rClNegPres cn vp = unify cn vp;
        rClNegPast cn vp = unify cn vp;
        rClNegFut  cn vp = unify cn vp;


        ---- Quantification

        someSg cn vp = quant "exists" cn vp;
        somePl cn vp = quant "exists" cn vp;
        an     cn vp = quant "exists" cn vp;
        no     cn vp = quant "no"     cn vp;
        every  cn vp = quant "forall" cn vp;
        all    cn vp = quant "forall" cn vp;
        the    cn vp = quant "the"    cn vp;
        most   cn vp = quant "most"   cn vp;


        ---- Coordination

        BaseEntity_NP e1 e2 = e1 ++ e2;
        ConsEntity_NP e1 e2 = e1 ++ e2;

        and_NP e = app "sum" e;
        or_NP  e = app "union" e;

        and_S s1 s2 = "(" ++ s1 ++ "and" ++ s2 ++ ")";
        or_S  s1 s2 = "(" ++ s1 ++ "or"  ++ s2 ++ ")";


        ---- Others

        Exists cn = quant "exists" "top" cn;


        ---------------------
        ---- Expressions ----
        ---------------------


        ---- Anaphors

        I     = "v_i";
        We    = "v_we";
        YouSg = "v_youSg";
        YouPl = "v_youPl";
        He    = "v_he";
        She   = "v_she";
        It    = "v_it";
        They  = "v_they";

        anaphor a   = a;
        poss    a p = a ++ ":" ++ (app p a);


        ---- Semantically light expressions

        have_Rel    = pred2 "have";
        with_Rel    = pred2 "with";
        possess_Rel = pred2 "possess";
        in_Rel      = pred2 "in";
        from_Rel    = pred2 "from";



    oper

        Clause = { np : Str; vp : Str; appdir : ApplicationDirection };

        pred1 : Str -> Str = \ p -> "lambda x" ++ p ++ "(x)";
        pred2 : Str -> Str = \ p -> "lambda y lambda x" ++ p ++ "(x,y)";
        pred3 : Str -> Str = \ p -> "lambda z lambda y lambda x" ++ p ++ "(x,y,z)";

        app   : Str -> Str -> Str = \ f, x -> "(" ++ f ++ "@" ++ x ++ ")";
        unify : Str -> Str -> Str = \ p, q -> "lambda v (" ++ (app p "v") ++ "and" ++ (app q "v") ++ ")";

        quant : Str -> Str -> Str -> Clause = \ q, cn, vp ->
              { np = "lambda vp" ++ q ++ "z [" ++ (app cn "z") ++ "] [" ++ (app "vp" "z") ++ "]"; vp = vp; appdir = NP2VP };

        not   : Str -> Str = \ e -> "not" ++ e;
        notcl : Clause -> Clause = \ cl ->
              { np = cl.np; vp = "lambda x not" ++ (app cl.vp "x"); appdir = cl.appdir };

        appcl : Clause -> Str = \ cl -> case cl.appdir of {
                                             VP2NP => app cl.vp cl.np;
                                             NP2VP => app cl.np cl.vp };

}
