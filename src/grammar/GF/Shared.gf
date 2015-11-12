abstract Shared = Core ** {

    fun 

        -- Implicatives 

        manage_to    : Property_VP -> Property_VP;
        forget_to    : Property_VP -> Property_VP;
        refuse_to    : Property_VP -> Property_VP;
        attempt_to   : Property_VP -> Property_VP;
        hesitate_to  : Property_VP -> Property_VP;

        force_to     : Entity_NP -> Property_VP -> Property_VP;

        -- Factives

        forget_that  : Sentence_S -> Property_VP;
        pretend_that : Sentence_S -> Property_VP;
}