abstract ScopalVerbs = Core ** {

    fun

        ---- Implicatives

        manage_to    : Predicate_VP -> Predicate_VP;
        forget_to    : Predicate_VP -> Predicate_VP;
        attempt_to   : Predicate_VP -> Predicate_VP;

        fail_to      : Predicate_VP -> Predicate_VP;
        refuse_to    : Predicate_VP -> Predicate_VP;
        hesitate_to  : Predicate_VP -> Predicate_VP;

        force_to     : NounPhrase -> Predicate_VP -> Predicate_VP;


        ---- Factives

        forget_that  : Sentence -> Predicate_VP;
        pretend_that : Sentence -> Predicate_VP;
        know_that    : Sentence -> Predicate_VP;


        ---- Modals

        -- can, must, want : ...

}
