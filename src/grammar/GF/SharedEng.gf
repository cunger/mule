concrete SharedEng of Shared = CoreEng ** open SyntaxEng, ParadigmsEng in {


    lin 

        -- Implicatives 

        manage_to    vp = mkVP (mkVV (mkV "manage")) vp;
        forget_to    vp = mkVP (mkVV (mkV "forget" "forgot" "forgotten")) vp;
        refuse_to    vp = mkVP (mkVV (mkV "refuse")) vp;
        attempt_to   vp = mkVP (mkVV (mkV "attempt")) vp;
        hesitate_to  vp = mkVP (mkVV (mkV "hesitate")) vp;

        force_to  np vp = mkVP (mkV2V (mkV "force") noPrep to_Prep) np vp;

        -- Factives

        know_that    s = mkVP (mkVS (mkV "know" "knew" "known")) s;
        forget_that  s = mkVP (mkVS (mkV "forget" "forgot" "forgotten")) s;
        pretend_that s = mkVP (mkVS (mkV "pretend")) s;

}