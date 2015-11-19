abstract Shared = Core ** {

    fun 

        ---- Implicatives 

        manage_to    : Predicate_VP -> Predicate_VP;
        forget_to    : Predicate_VP -> Predicate_VP;
        refuse_to    : Predicate_VP -> Predicate_VP;
        attempt_to   : Predicate_VP -> Predicate_VP;
        hesitate_to  : Predicate_VP -> Predicate_VP;

        force_to     : Entity_NP -> Predicate_VP -> Predicate_VP;


        ---- Factives

        forget_that  : Sentence_S -> Predicate_VP;
        pretend_that : Sentence_S -> Predicate_VP;
        know_that    : Sentence_S -> Predicate_VP;


        ---- Modals 

        -- can, must, want : ...

}