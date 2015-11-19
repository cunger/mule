abstract Core = {

	
    cat 

        Anaphor_Pron;

        Entity_NP;
        [Entity_NP] {2};

        Predicate_CN;
        Predicate_AP; 
        Predicate_VP;
        Predicate_Adv;

        Predicate'_CN;
        Predicate'_AP; 
        Predicate'_VP;
        Predicate'_Adv;

        Relation_N2;
        Relation_A2;
        Relation_V2;
        Relation_Prep;

        Relation'_N2;
        Relation'_A2;
        Relation'_V2;
        Relation'_Prep;

        Clause_Cl;
        Sentence_S;

        Text_Str;


    fun 

        --------------------
        ---- Operations ----
        --------------------


        root_S   : Sentence_S    -> Text_Str;
        root_NP  : Entity_NP     -> Text_Str;
        root_VP  : Predicate_VP  -> Text_Str;
        root_CN  : Predicate_CN  -> Text_Str;
        root_AP  : Predicate_AP  -> Text_Str;
        root_Adv : Predicate_Adv -> Text_Str;
        

        ---- Application 
       
        -- linear

        apply_V2    : Relation_V2   -> Entity_NP -> Predicate_VP;
        apply_N2_   : Relation_N2   -> Entity_NP -> Predicate_CN;
        apply_A2    : Relation_A2   -> Entity_NP -> Predicate_AP;
        apply_Prep  : Relation_Prep -> Entity_NP -> Predicate_Adv;

        apply_VP    : Entity_NP -> Predicate_VP  -> Clause_Cl; 

        lift_CN_d   : Predicate_CN  -> Predicate_VP;
        lift_CN_i   : Predicate_CN  -> Predicate_VP;
        lift_AP     : Predicate_AP  -> Predicate_VP;
        lift_Adv    : Predicate_Adv -> Predicate_VP; 

        -- reverse

        apply'_V2   : Relation'_V2   -> Entity_NP -> Predicate'_VP;
        apply'_N2   : Relation'_N2   -> Entity_NP -> Predicate'_CN;
        apply'_A2   : Relation'_A2   -> Entity_NP -> Predicate'_AP;
        apply'_Prep : Relation'_Prep -> Entity_NP -> Predicate'_Adv;

        apply'_VP   : Entity_NP -> Predicate'_VP  -> Clause_Cl; 

        lift'_CN_d  : Predicate_CN  -> Predicate_VP;
        lift'_CN_i  : Predicate_CN  -> Predicate_VP;
        lift'_AP    : Predicate_AP  -> Predicate_VP;
        lift'_Adv   : Predicate_Adv -> Predicate_VP; 
        

        ---- Polarity and tense

        sPosPres : Clause_Cl -> Sentence_S;
        sPosPast : Clause_Cl -> Sentence_S;
        sPosFut  : Clause_Cl -> Sentence_S;
        sNegPres : Clause_Cl -> Sentence_S;
        sNegPast : Clause_Cl -> Sentence_S;
        sNegFut  : Clause_Cl -> Sentence_S;        

        
        ---- Modification
        
        modify_AP_CN  : Predicate_AP  -> Predicate_CN -> Predicate_CN; 
        modify_Adv_VP : Predicate_Adv -> Predicate_VP -> Predicate_VP;        

        rClPosPres : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClPosPast : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClPosFut  : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClNegPres : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClNegPast : Predicate_CN -> Predicate_VP -> Predicate_CN;
        rClNegFut  : Predicate_CN -> Predicate_VP -> Predicate_CN;
 

        ---- Quantification

        every, someSg, somePl, an, no, the, all, most : Predicate_CN -> Predicate_VP -> Clause_Cl;
 

        ---- Coordination 

        and_NP, or_NP : [Entity_NP] -> Entity_NP; 

        and_S, or_S : Sentence_S -> Sentence_S -> Sentence_S;


        ---- Others

        Exists : Predicate_CN -> Clause_Cl;


        ---------------------
        ---- Expressions ----
        ---------------------

    
        ---- Anaphors 

        I, We, YouSg, YouPl, He, She, It, They : Anaphor_Pron; 

        anaphor : Anaphor_Pron -> Entity_NP;
        poss    : Anaphor_Pron -> Predicate_CN -> Entity_NP;

    
        ---- Semantically light expressions 

        have_Rel    : Relation_V2;

        with_Rel    : Relation_Prep;
        possess_Rel : Relation_Prep;
        in_Rel      : Relation_Prep;
        from_Rel    : Relation_Prep;  

}