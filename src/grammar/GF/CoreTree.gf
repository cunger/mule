concrete CoreTree of Core = Cat ** {

    param 

        Marking = Plus | Minus | None;
        Switch  = Reverse | Keep | Break;


    lincat

        Entity_NP = Marking => Str;

        Property_CN, Property_AP, Property_VP = Marking => Str;
        Relation_N2, Relation_A2, Relation_V2 = Marking => Str;

        Clause_Cl, Sentence_S = Marking => Str;
        Text_Str = Str;


    lin 

        root s = s ! Plus;


        -- Internal and external arguments

        vp v2 np = branch2 "int_v2" v2 np;
        cn n2 np = branch2 "int_n2" n2 np;
        ap a2 np = branch2 "int_a2" a2 np;

        cn_vp cn = branch1 "cn_vp" cn;
        ap_vp ap = branch1 "ap_vp" ap;

        cl np vp = branch2 "cl" np vp;

        sPosPres cl = branch1 "sPosPres" cl;
        sPosPast cl = branch1 "sPosPast" cl; 
        sPosFut  cl = branch1 "sPosFut"  cl; 
        sNegPres cl = branch1 "sNegPres" ((switch cl) ! Reverse);
        sNegPast cl = branch1 "sNegPast" ((switch cl) ! Reverse); 
        sNegFut  cl = branch1 "sNegFut"  ((switch cl) ! Reverse); 

        
        -- Modifiers
        
        adjective ap cn = branch2 "adjective" ap cn;  


        -- Relative clauses

        rClPosPres cn vp = branch2 "rClPosPres" cn vp;
        rClPosPast cn vp = branch2 "rClPosPast" cn vp;
        rClPosFut  cn vp = branch2 "rClPosFut"  cn vp;
        rClNegPres cn vp = branch2 "rClNegPres" cn ((switch vp) ! Reverse);
        rClNegPast cn vp = branch2 "rClNegPast" cn ((switch vp) ! Reverse);
        rClNegFut  cn vp = branch2 "rClNegFut"  cn ((switch vp) ! Reverse);


        -- Quantifiers

        someSg cn vp = branch2 "someSg" cn vp; 
        somePl cn vp = branch2 "somePl" cn vp; 
        an     cn vp = branch2 "an"     cn vp; 
        no     cn vp = branch2 "no"    ((switch cn) ! Reverse) ((switch vp) ! Reverse); 
        every  cn vp = branch2 "every" ((switch cn) ! Reverse) vp;
        all    cn vp = branch2 "all"   ((switch cn) ! Reverse) vp; 
        the    cn vp = branch2 "the"   ((switch cn) ! Break) vp; 
        most   cn vp = branch2 "most"  ((switch cn) ! Break) vp; 


    oper 

        leaf : Str -> (Marking => Str) = \ s -> 
        table { Plus  => s ++ "+"; 
                Minus => s ++ "-"; 
                None  => s ++ "o" };
        
        branch1 : Str -> (Marking => Str) -> (Marking => Str) = \ s,t -> 
        table { Plus  => s ++ "+" ++ "[" ++ t ! Plus  ++ "]"; 
                Minus => s ++ "-" ++ "[" ++ t ! Minus ++ "]"; 
                None  => s ++ "o" ++ "[" ++ t ! None  ++ "]" };

        branch2 : Str -> (Marking => Str) -> (Marking => Str) -> (Marking => Str) = \ s,t1,t2 -> 
        table { Plus  => s ++ "+" ++ "[" ++ t1 ! Plus  ++ "," ++ t2 ! Plus  ++ "]"; 
                Minus => s ++ "-" ++ "[" ++ t1 ! Minus ++ "," ++ t2 ! Minus ++ "]"; 
                None  => s ++ "o" ++ "[" ++ t1 ! None  ++ "," ++ t2 ! None  ++ "]" };
        
        switch : (Marking => Str) -> (Switch => Marking => Str) = \ s ->   
        table { Reverse => table { Plus  => s ! Minus;
                                   Minus => s ! Plus;
                                   None  => s ! None }; 
                Keep    => table { m     => s ! m }; 
                Break   => table { _     => s ! None } }; 

}