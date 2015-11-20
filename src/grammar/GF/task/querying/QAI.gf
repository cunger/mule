incomplete concrete QAI of QA = CoreI ** {


 lincat
  
    WhPron = IP;
    WhAdv  = IAdv;

    Predicate_VPSlash = VPSlash;
    Clause_ClSlash    = ClSlash;

    Question_QCl = QCl;
    Question_QS  = QS;


 fun 
    
    ---- Imperative 

    prompt vp = (mkUtt (mkImp vp)).s;


    ---- Questions ----

    ask qs = (mkUtt qs).s;


    Who   = who_IP;
    What  = what_IP;
    Where = where_IAdv;
    When  = when_IAdv;
    How   = how_IAdv;
    Why   = why_IAdv;

    WhichSg p = mkIP which_IDet    p; 
    WhichPl p = mkIP whichPl_IDet  p;
    HowMany p = mkIP how8many_IDet p;

    query_wh w = mkQCl w;

    query_V2 r = mkVPSlash r;

    query_VP  wh p = mkQCl wh p;
    query_CN  wh p = mkQCl wh p;
    query_AP  wh p = mkQCl wh p;
    query_Adv wh p = mkQCl wh p;
    
    apply_VPSlash e  vpslash = mkClSlash e vpslash;
    query_VPSlash wh clslash = mkQS wh clslash;

    query_Cl         cl = mkQCl cl;
    query_IAdv_Cl wh cl = mkQCl wh cl;

    qPosPres qcl = mkQS presentTense positivePol qcl; 
    qPosPast qcl = mkQS presentTense positivePol qcl; 
    qPosFut  qcl = mkQS presentTense positivePol qcl; 
    qNegPres qcl = mkQS presentTense positivePol qcl; 
    qNegPast qcl = mkQS presentTense positivePol qcl; 
    qNegFut  qcl = mkQS presentTense positivePol qcl; 


    ---- Answers ----

    yes = yes_Utt.s;
    no  = no_Utt.s;

}