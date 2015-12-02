abstract QA = Core ** {


 cat

    WhPron;
    WhAdv;

    Predicate_VPSlash;
    Clause_ClSlash;

    Question_QCl;
    Question_QS;
    Imperative_Imp;


 fun

    ---- Imperative

    prompt : Predicate_VP -> Text_Str;


    ---- Questions ----

    ask : Question_QS -> Text_Str;


    Who  : WhPron;
    What : WhPron;
    Where, When, How, Why : WhAdv;

    WhichSg, WhichPl, HowMany : Predicate_CN -> WhPron;

    query_wh  : WhPron -> Question_QCl;

    query_V2  : Relation_V2 -> Predicate_VPSlash;

    query_VP  : WhPron -> Predicate_VP  -> Question_QCl;
    query_CN  : WhPron -> Predicate_CN  -> Question_QCl;
    query_AP  : WhPron -> Predicate_AP  -> Question_QCl;
    query_Adv : WhPron -> Predicate_Adv -> Question_QCl;

    apply_VPSlash : NounPhrase -> Predicate_VPSlash -> Clause_ClSlash;
    query_VPSlash : WhPron -> Clause_ClSlash -> Question_QCl;

    query_Cl      : Clause -> Question_QCl;
    query_IAdv_Cl : WhAdv -> Clause -> Question_QCl;

    qPosPres : Question_QCl -> Question_QS;
    qPosPast : Question_QCl -> Question_QS;
    qPosFut  : Question_QCl -> Question_QS;
    qNegPres : Question_QCl -> Question_QS;
    qNegPast : Question_QCl -> Question_QS;
    qNegFut  : Question_QCl -> Question_QS;


    ---- Answers ----

    answer_yes : Text_Str;
    answer_no  : Text_Str;

}
