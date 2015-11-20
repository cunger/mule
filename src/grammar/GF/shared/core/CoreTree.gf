concrete CoreTree of Core = {

    param 

        Marking = Plus | Minus | None;
        Switch  = Reverse | Keep | Break;


    lincat

        Anaphor_Pron   = Marking => Str;

        Entity_NP      = Marking => Str;
        [Entity_NP]    = Marking => Str;

        Predicate_CN   = Marking => Str;
        Predicate_AP   = Marking => Str;
        Predicate_VP   = Marking => Str;
        Predicate_Adv  = Marking => Str;

        Relation_N2    = Marking => Str;
        Relation_A2    = Marking => Str;
        Relation_V2    = Marking => Str;
        Relation_Prep  = Marking => Str;

        Clause_Cl      = Marking => Str;
        Sentence_S     = Marking => Str;
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

        lift_CN_d p = branch1 "lift_CN_d" p; 
        lift_CN_i p = branch1 "lift_CN_i" p;
        lift_AP   p = branch1 "lift_AP"   p;
        lift_Adv  p = branch1 "lift_Adv"  p;
        lift_NP   e = branch1 "lift_NP"   e;


        ---- Polarity and tense

        sPosPres cl = branch1 "sPosPres" cl;
        sPosPast cl = branch1 "sPosPast" cl; 
        sPosFut  cl = branch1 "sPosFut"  cl; 
        sNegPres cl = branch1 "sNegPres" ((switch cl) ! Reverse);
        sNegPast cl = branch1 "sNegPast" ((switch cl) ! Reverse); 
        sNegFut  cl = branch1 "sNegFut"  ((switch cl) ! Reverse); 

        
        ---- Modification 

        modify_AP_CN  mod p = branch2 "modify_AP_CN" mod p;  
        modify_Adv_VP mod p = branch2 "modify_AP_CN" mod p;  

        rClPosPres cn vp = branch2 "rClPosPres" cn vp;
        rClPosPast cn vp = branch2 "rClPosPast" cn vp;
        rClPosFut  cn vp = branch2 "rClPosFut"  cn vp;
        rClNegPres cn vp = branch2 "rClNegPres" cn ((switch vp) ! Reverse);
        rClNegPast cn vp = branch2 "rClNegPast" cn ((switch vp) ! Reverse);
        rClNegFut  cn vp = branch2 "rClNegFut"  cn ((switch vp) ! Reverse);


        ---- Quantification

        someSg cn vp = branch2 "quant" (branch1 "someSg" cn) vp; 
        somePl cn vp = branch2 "quant" (branch1 "somePl" cn) vp; 
        an     cn vp = branch2 "quant" (branch1 "an"     cn) vp; 
        no     cn vp = branch2 "quant" (branch1 "no"    ((switch cn) ! Reverse)) ((switch vp) ! Reverse); 
        every  cn vp = branch2 "quant" (branch1 "every" ((switch cn) ! Reverse)) vp;
        all    cn vp = branch2 "quant" (branch1 "all"   ((switch cn) ! Reverse)) vp; 
        the    cn vp = branch2 "quant" (branch1 "the"   ((switch cn) ! Break)) vp; 
        most   cn vp = branch2 "quant" (branch1 "most"  ((switch cn) ! Break)) vp; 


        ---- Coordination 

        BaseEntity_NP e1 e2 = branch2 "BaseEntity_NP" e1 e2; 
        ConsEntity_NP e1 e2 = branch2 "ConsEntity_NP" e1 e2;  
        
        and_NP e = branch1 "and_NP" e;
        or_NP  e = branch1 "or_NP"  e;

        and_S s1 s2 = branch2 "and_S" s1 s2;
        or_S  s1 s2 = branch2 "or_S"  s1 s2;


        ---- Others

        Exists cn = branch1 "Exists" cn;


        ---------------------
        ---- Expressions ----
        ---------------------

    
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
        poss    a p = branch2 "poss" a p; 


        ---- Semantically light expressions

        have_Rel    = leaf "have_V2";
        with_Rel    = leaf "with_Prep";
        possess_Rel = leaf "possess_Prep";
        in_Rel      = leaf "in_Prep";
        from_Rel    = leaf "from_Prep";


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