abstract Core = {

	
    cat 

        Entity_NP;

        Property_CN;
        Property_AP; 
        Property_VP;

        Relation_N2;
        Relation_A2;
        Relation_V2;

        Clause_Cl;
        Sentence_S;
        Text_Str;


    fun 

        root : Sentence_S -> Text_Str;

       
        -- Constructing sentences

        vp : Relation_V2 -> Entity_NP -> Property_VP;
        cn : Relation_N2 -> Entity_NP -> Property_CN;   
        ap : Relation_A2 -> Entity_NP -> Property_AP;   
        
        cn_vp : Property_CN -> Property_VP;
        ap_vp : Property_AP -> Property_VP;

        cl : Entity_NP -> Property_VP -> Clause_Cl;

        sPosPres : Clause_Cl -> Sentence_S;
        sPosPast : Clause_Cl -> Sentence_S;
        sPosFut  : Clause_Cl -> Sentence_S;
        sNegPres : Clause_Cl -> Sentence_S;
        sNegPast : Clause_Cl -> Sentence_S;
        sNegFut  : Clause_Cl -> Sentence_S;        

        
        -- Modifiers
        
        adjective  : Property_AP -> Property_CN -> Property_CN;  
        

        -- Relative clauses

        rClPosPres : Property_CN -> Property_VP -> Property_CN;
        rClPosPast : Property_CN -> Property_VP -> Property_CN;
        rClPosFut  : Property_CN -> Property_VP -> Property_CN;
        rClNegPres : Property_CN -> Property_VP -> Property_CN;
        rClNegPast : Property_CN -> Property_VP -> Property_CN;
        rClNegFut  : Property_CN -> Property_VP -> Property_CN;
 

        -- Quantifiers

        every, someSg, somePl, an, no, the, all, most : Property_CN -> Property_VP -> Clause_Cl;
  
}