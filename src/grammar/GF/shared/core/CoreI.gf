incomplete concrete CoreI of Core = open Syntax in {
	

    lincat 

        Anaphor_Pron   = Pron;

        Entity_NP      = NP;
        [Entity_NP]    = [NP];

        Predicate_CN   = CN;
        Predicate_AP   = AP; 
        Predicate_VP   = VP;
        Predicate_Adv  = Adv;

        Relation_N2    = N2; 
        Relation_A2    = A2; 
        Relation_V2    = V2; 
        Relation_Prep  = Prep;

        Clause_Cl      = Cl;
        Sentence_S     = S;
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

        lift_CN_d p = mkVP (mkNP the_Det p); 
        lift_CN_i p = mkVP (mkNP a_Det p); 
        lift_AP   p = mkVP p; 
        lift_Adv  p = mkVP p;
        lift_NP   e = mkVP e;


        ---- Polarity and tense
                
        sPosPres cl = mkS presentTense positivePol cl; 
        sPosPast cl = mkS pastTense    positivePol cl; 
        sPosFut  cl = mkS futureTense  positivePol cl; 
        sNegPres cl = mkS presentTense negativePol cl; 
        sNegPast cl = mkS pastTense    negativePol cl; 
        sNegFut  cl = mkS futureTense  negativePol cl; 


        ---- Modification 

        modify_AP_CN  mod p = mkCN mod p;  
        modify_Adv_VP mod p = mkVP p mod; 

        rClPosPres cn vp = mkCN cn (mkRS presentTense positivePol (mkRCl which_RP vp)); 
        rClPosPast cn vp = mkCN cn (mkRS pastTense    positivePol (mkRCl which_RP vp)); 
        rClPosFut  cn vp = mkCN cn (mkRS futureTense  positivePol (mkRCl which_RP vp)); 
        rClNegPres cn vp = mkCN cn (mkRS presentTense negativePol (mkRCl which_RP vp)); 
        rClNegPast cn vp = mkCN cn (mkRS pastTense    negativePol (mkRCl which_RP vp)); 
        rClNegFut  cn vp = mkCN cn (mkRS futureTense  negativePol (mkRCl which_RP vp)); 
     

        ---- Quantification

        every  cn vp = mkCl (mkNP every_Det  cn) vp;        
        someSg cn vp = mkCl (mkNP someSg_Det cn) vp; 
        somePl cn vp = mkCl (mkNP somePl_Det cn) vp;
        an     cn vp = mkCl (mkNP aSg_Det    cn) vp; 
        no     cn vp = mkCl (mkNP (mkDet no_Quant) cn) vp; 
        the    cn vp = mkCl (mkNP the_Det cn) vp; 
        all    cn vp = mkCl (mkNP all_Predet (mkNP aPl_Det cn)) vp; 
        most   cn vp = mkCl (mkNP most_Predet (mkNP aPl_Det cn)) vp;

        
        ---- Coordination 

        BaseEntity_NP e1 e2 = mkListNP e1 e2; 
        ConsEntity_NP e1 e2 = mkListNP e1 e2;  
        
        and_NP e = mkNP and_Conj e; 
        or_NP  e = mkNP or_Conj  e;

        and_S s1 s2 = mkS and_Conj s1 s2;
        or_S  s1 s2 = mkS or_Conj  s1 s2;


        ---- Others

        Exists cn = mkCl cn;


        ---------------------
        ---- Expressions ----
        ---------------------

    
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


        ---- Semantically light expressions

        have_Rel    = have_V2; 
        with_Rel    = with_Prep; 
        possess_Rel = possess_Prep;
        in_Rel      = in_Prep; 
        from_Rel    = from_Prep; 

}