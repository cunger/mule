abstract Core = {

	
    cat 

        Anaphor_Pron;

        Entity_NP;
        [Entity_NP] {2};

        Predicate_CN;
        Predicate_AP; 
        Predicate_VP;
        Predicate_Adv;

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
       
        apply_V2        : Relation_V2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply_N2_def    : Relation_N2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply_N2_indef  : Relation_N2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply_A2        : Relation_A2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply_Prep      : Relation_Prep -> Entity_NP -> Entity_NP -> Clause_Cl;

        apply'_V2       : Relation'_V2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply'_N2_def   : Relation'_N2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply'_N2_indef : Relation'_N2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply'_A2       : Relation'_A2   -> Entity_NP -> Entity_NP -> Clause_Cl;
        apply'_Prep     : Relation'_Prep -> Entity_NP -> Entity_NP -> Clause_Cl;

        apply_VP : Entity_NP -> Predicate_VP -> Clause_Cl; 

        lift_CN  : Predicate_CN  -> Predicate_VP;
        lift_AP  : Predicate_AP  -> Predicate_VP;
        lift_Adv : Predicate_Adv -> Predicate_VP;

        
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