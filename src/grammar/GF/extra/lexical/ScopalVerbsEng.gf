concrete ScopalVerbsEng of ScopalVerbs = CatEng ** open ParadigmsEng in {


    lin

        manage_to    = mkVV (mkV "manage");
        forget_to    = mkVV (mkV "forget" "forgot" "forgotten");
        attempt_to   = mkVV (mkV "attempt");

        fail_to      = mkVV (mkV "fail");
        refuse_to    = mkVV (mkV "refuse");
        hesitate_to  = mkVV (mkV "hesitate");

    --  force_to  np vp = ...;

        know_that    = mkVS (mkV "know" "knew" "known");
        forget_that  = mkVS (mkV "forget" "forgot" "forgotten");
        pretend_that = mkVS (mkV "pretend");

}
