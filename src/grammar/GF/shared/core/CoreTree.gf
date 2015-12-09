concrete CoreTree of Core = {

    param

        Marking = Plus | Minus | None;
        Switch  = Reverse | Keep | Break;


    lincat

        Anaphor        = Marking => Str;

        NounPhrase     = Marking => Str;
       [NounPhrase]    = Marking => Str;

        Predicate_CN   = Marking => Str;
        Predicate_AP   = Marking => Str;
       [Predicate_AP]  = Marking => Str;
        Predicate_VP   = Marking => Str;
        Predicate_Adv  = Marking => Str;
       [Predicate_Adv] = Marking => Str;

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

        apply_V2    r e = branch2 "VP"  r e;
        apply_N2    r e = branch2 "NP"  r e;
        apply_A2    r e = branch2 "AP"  r e;
        apply_Prep  r e = branch2 "Adv" r e;

        apply_VP    e p = branch2 "Cl" e p;

        copula_CN_d p = branch1 "VP" p;
        copula_CN_i p = branch1 "VP" p;
        copula_AP   p = branch1 "VP" p;
        copula_Adv  p = branch1 "VP" p;
        copula_NP   e = branch1 "VP" e;


        ---- Polarity and tense

        sPosPres cl = branch1 "S_Pres" cl;
        sPosPast cl = branch1 "S_Past" cl;
        sPosFut  cl = branch1 "S_Fut"  cl;
        sNegPres cl = branch1 "S_Pres" (branch1 "not" ((switch cl) ! Reverse));
        sNegPast cl = branch1 "S_Past" (branch1 "not" ((switch cl) ! Reverse));
        sNegFut  cl = branch1 "S_Fut"  (branch1 "not" ((switch cl) ! Reverse));


        ---- Modification

        modify_AP_CN  mod p = modify p mod;
        modify_Adv_CN mod p = modify p mod;
        modify_Adv_VP mod p = modify p mod;

        rClPosPres cn vp = branch2 "RCl" cn vp;
        rClPosPast cn vp = branch2 "RCl" cn vp;
        rClPosFut  cn vp = branch2 "RCl"  cn vp;
        rClNegPres cn vp = branch2 "RCl" cn ((switch vp) ! Reverse);
        rClNegPast cn vp = branch2 "RCl" cn ((switch vp) ! Reverse);
        rClNegFut  cn vp = branch2 "RCl"  cn ((switch vp) ! Reverse);


        ---- Determiners

        every  cn = branch1 "all" ((switch cn) ! Reverse);
        all    cn = branch1 "all" ((switch cn) ! Reverse);

        someSg cn = branch1 "some" cn;
        somePl cn = branch1 "some" cn;
        an     cn = branch1 "some" cn;

        the    cn = branch1 "the"  ((switch cn) ! Break);

        most   cn = branch1 "most" ((switch cn) ! Break);
        many   cn = branch1 "many" cn;

        no  cn vp = branch2 "no"  ((switch cn) ! Reverse) ((switch vp) ! Reverse);
        few cn vp = branch2 "few" ((switch cn) ! Reverse) ((switch vp) ! Reverse);


        ---- Coordination

        BaseNounPhrase    e1 e2 = modify e1 e2;
        ConsNounPhrase    e1 e2 = modify e1 e2;
        BasePredicate_AP  e1 e2 = modify e1 e2;
        ConsPredicate_AP  e1 e2 = modify e1 e2;
        BasePredicate_Adv e     = e;
        ConsPredicate_Adv e1 e2 = modify e1 e2;

        and_NP  e = branch1 "and"  e;
        or_NP   e = branch1 "or"   e;
        and_AP  e = branch1 "and"  e;
        or_AP   e = branch1 "or"   e;

        and_Adv e1 e2 = branch2 "and" e1 e2;
        or_Adv  e1 e2 = branch2 "or"  e1 e2;

        and_S   s1 s2 = branch2 "and" s1 s2;
        or_S    s1 s2 = branch2 "or"  s1 s2;

        if_then_S s1 s2 = branch2 "if_then" ((switch s1) ! Reverse) s2;


        ---- Others

        Exists cn = branch1 "Exists" cn;


        ---------------------
        ---- Expressions ----
        ---------------------


        somebody   = leaf "NP" "somebody";
        something  = leaf "NP" "something";
        everybody  = leaf "NP" "everybody";
        everything = leaf "NP" "everything";
        nobody     = leaf "NP" "nobody";
        nothing    = leaf "NP" "nothing";


        ---- Anaphors

        I     = leaf "NP" "i_Pron";
        We    = leaf "NP" "we_Pron";
        YouSg = leaf "NP" "youSg_Pron";
        YouPl = leaf "NP" "youPl_Pron";
        He    = leaf "NP" "he_Pron";
        She   = leaf "NP" "she_Pron";
        It    = leaf "NP" "it_Pron";
        They  = leaf "NP" "they_Pron";

        anaphor a   = branch1 "anaphor" a;
        poss    a p = branch2 "poss" a p;


    oper

        ---------------------------
        ---- Marking algorithm ----
        ---------------------------

        leaf : Str -> Str -> (Marking => Str) = \ c,s ->
        table { m => c ++ s ++ (show m) };

        branch1 : Str -> (Marking => Str) -> (Marking => Str) = \ s,t ->
        table { m => s ++ (show m) ++ "[" ++ t ! m  ++ "]" };

        branch2 : Str -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) = \ s,t1,t2 ->
        table { m => s ++ (show m) ++ "[" ++ t1 ! m ++ "," ++ t2 ! m ++ "]" };

        branch3 : Str -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) = \ s,t1,t2,t3 ->
        table { m => s ++ (show m) ++ "[" ++ t1 ! m ++ "," ++ t2 ! m ++ "," ++ t3 ! m ++ "]" };

        -- Use with care!
        modify : (Marking => Str) -> (Marking => Str) -> (Marking => Str) = \ t1,t2 ->
        table { m => t1 ! m ++ "," ++ t2 ! m };

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

        lift : Str -> Marking => Str = \ s -> table { _ => s };
}
