concrete CoreTree of Core = {

    param

        Marking = Plus | Minus | None;
        Switch  = Reverse | Keep | Break;


    lincat

        Anaphor        = Marking => Str;

        NounPhrase     = Marking => Str;
        [NounPhrase]   = Marking => Str;

        Predicate_CN   = Marking => Str;
        Predicate_AP   = Marking => Str;
        Predicate_VP   = Marking => Str;
        Predicate_Adv  = Marking => Str;

        Relation_N2    = Marking => Str;
        Relation_A2    = Marking => Str;
        Relation_V2    = Marking => Str;
        Relation_Prep  = Marking => Str;

        Clause         = Marking => Str;
        Sentence       = Marking => Str;
        Text_Str       = Str;


    lin

        --------------------
        ---- Operations ----
        --------------------


        root_S     s = s   ! Plus;
        root_NP   np = np  ! Plus;
        root_VP   vp = vp  ! Plus;
        root_CN   cn = cn  ! Plus;
        root_AP   ap = ap  ! Plus;
        root_Adv adv = adv ! Plus;


        ---- Application

        apply_V2    r e = branch2 "apply_V2"   r e;
        apply_N2    r e = branch2 "apply_N2"   r e;
        apply_A2    r e = branch2 "apply_A2"   r e;
        apply_Prep  r e = branch2 "apply_Prep" r e;

        apply_VP    e p = branch2 "apply_VP" e p;

        copula_CN_d p = branch1 "copula_CN_d" p;
        copula_CN_i p = branch1 "copula_CN_i" p;
        copula_AP   p = branch1 "copula_AP"   p;
        copula_Adv  p = branch1 "copula_Adv"  p;
        copula_NP   e = branch1 "copula_NP"   e;


        ---- Polarity and tense

        sPosPres cl = branch1 "sPosPres" cl;
        sPosPast cl = branch1 "sPosPast" cl;
        sPosFut  cl = branch1 "sPosFut"  cl;
        sNegPres cl = branch1 "sNegPres" ((switch cl) ! Reverse);
        sNegPast cl = branch1 "sNegPast" ((switch cl) ! Reverse);
        sNegFut  cl = branch1 "sNegFut"  ((switch cl) ! Reverse);


        ---- Modification

        modify_AP_CN  mod p = branch2 "modify_AP_CN"  mod p;
        modify_Adv_CN mod p = branch2 "modify_Adv_CN" mod p;
        modify_Adv_VP mod p = branch2 "modify_Adv_VP" mod p;

        rClPosPres cn vp = branch2 "rClPosPres" cn vp;
        rClPosPast cn vp = branch2 "rClPosPast" cn vp;
        rClPosFut  cn vp = branch2 "rClPosFut"  cn vp;
        rClNegPres cn vp = branch2 "rClNegPres" cn ((switch vp) ! Reverse);
        rClNegPast cn vp = branch2 "rClNegPast" cn ((switch vp) ! Reverse);
        rClNegFut  cn vp = branch2 "rClNegFut"  cn ((switch vp) ! Reverse);


        ---- Determiners

        every  cn = branch1 "every" ((switch cn) ! Reverse);
        all    cn = branch1 "all"   ((switch cn) ! Reverse);

        someSg cn = branch1 "someSg" cn;
        somePl cn = branch1 "somePl" cn;
        an     cn = branch1 "an"     cn;

        the    cn = branch1 "the"  ((switch cn) ! Break);

        most   cn = branch1 "most" ((switch cn) ! Break);
        many   cn = branch1 "many" cn;

        no  cn vp = branch2 "no"  ((switch cn) ! Reverse) ((switch vp) ! Reverse);
        few cn vp = branch2 "few" ((switch cn) ! Reverse) ((switch vp) ! Reverse);


        ---- Coordination

        BaseNounPhrase e1 e2 = branch2 "BaseNounPhrase" e1 e2;
        ConsNounPhrase e1 e2 = branch2 "ConsNounPhrase" e1 e2;

        and_NP e = branch1 "and_NP" e;
        or_NP  e = branch1 "or_NP"  e;

        and_S s1 s2 = branch2 "and_S" s1 s2;
        or_S  s1 s2 = branch2 "or_S"  s1 s2;

        if_then_S s1 s2 = branch2 "if_then_S" ((switch s1) ! Reverse) s2;


        ---- Others

        Exists cn = branch1 "Exists" cn;


        ---------------------
        ---- Expressions ----
        ---------------------

        somebody  = leaf "somebody";
        something = leaf "something";

        ---- Anaphors

        I     = leaf "i_Pron";
        We    = leaf "we_Pron";
        YouSg = leaf "youSg_Pron";
        YouPl = leaf "youPl_Pron";
        He    = leaf "he_Pron";
        She   = leaf "she_Pron";
        It    = leaf "it_Pron";
        They  = leaf "they_Pron";

        anaphor a   = branch1 "anaphor" a;
--      poss    a p = branch2 "poss" a p;


    oper

        ---------------------------
        ---- Marking algorithm ----
        ---------------------------

        leaf : Str -> (Marking => Str) = \ s ->
        table { m => s ++ (show m) };

        branch1 : Str -> (Marking => Str) -> (Marking => Str) = \ s,t ->
        table { m => s ++ (show m) ++ "[" ++ t ! m  ++ "]" };

        branch2 : Str -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) = \ s,t1,t2 ->
        table { m => s ++ (show m) ++ "[" ++ t1 ! m ++ "," ++ t2 ! m ++ "]" };

        branch3 : Str -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) = \ s,t1,t2,t3 ->
        table { m => s ++ (show m) ++ "[" ++ t1 ! m ++ "," ++ t2 ! m ++ "," ++ t3 ! m ++ "]" };

        show : Marking -> Str = \ m -> case m of {
               Plus  => "+";
               Minus => "-";
               None  => "o"
        };

        switch : (Marking => Str) -> (Switch => Marking => Str) = \ s ->
        table { Reverse => table { Plus  => s ! Minus;
                                   Minus => s ! Plus;
                                   None  => s ! None };
                Keep    => table { m     => s ! m };
                Break   => table { _     => s ! None } };

}
