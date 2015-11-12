incomplete concrete CoreI of Core = open Syntax in {
	

    lincat 

        Entity_NP   = NP;

        Property_CN = CN;
        Property_AP = AP; 
        Property_VP = VP;

        Relation_N2 = N2;
        Relation_A2 = A2;
        Relation_V2 = V2;

        Clause_Cl   = Cl;
        Sentence_S  = S;
        Text_Str    = Str;


    lin 

        root s = (mkUtt s).s;


        -- Internal and external arguments

        vp v2 np = mkVP v2 np;
        cn n2 np = mkCN n2 np;   
        ap a2 np = mkAP a2 np;

        cn_vp cn = mkVP cn;
        ap_vp ap = mkVP ap;

        cl np vp = mkCl np vp;
        
        sPosPres cl = mkS presentTense positivePol cl; 
        sPosPast cl = mkS pastTense    positivePol cl; 
        sPosFut  cl = mkS futureTense  positivePol cl; 
        sNegPres cl = mkS presentTense negativePol cl; 
        sNegPast cl = mkS pastTense    negativePol cl; 
        sNegFut  cl = mkS futureTense  negativePol cl; 


        -- Modifiers

        adjective ap cn = mkCN ap cn;       


        -- Relative clauses

        rClPosPres cn vp = mkCN cn (mkRS presentTense positivePol (mkRCl which_RP vp)); 
        rClPosPast cn vp = mkCN cn (mkRS pastTense    positivePol (mkRCl which_RP vp)); 
        rClPosFut  cn vp = mkCN cn (mkRS futureTense  positivePol (mkRCl which_RP vp)); 
        rClNegPres cn vp = mkCN cn (mkRS presentTense negativePol (mkRCl which_RP vp)); 
        rClNegPast cn vp = mkCN cn (mkRS pastTense    negativePol (mkRCl which_RP vp)); 
        rClNegFut  cn vp = mkCN cn (mkRS futureTense  negativePol (mkRCl which_RP vp)); 
     

        -- Quantifiers

        every  cn vp = mkCl (mkNP every_Det  cn) vp;        
        someSg cn vp = mkCl (mkNP someSg_Det cn) vp; 
        somePl cn vp = mkCl (mkNP somePl_Det cn) vp;
        an     cn vp = mkCl (mkNP aSg_Det    cn) vp; 
        no     cn vp = mkCl (mkNP (mkDet no_Quant) cn) vp; 
        the    cn vp = mkCl (mkNP the_Det cn) vp; 
        all    cn vp = mkCl (mkNP all_Predet (mkNP somePl_Det cn)) vp; 
        most   cn vp = mkCl (mkNP most_Predet (mkNP aPl_Det cn)) vp;

}