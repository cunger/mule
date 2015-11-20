concrete ScopalVerbsDut of ScopalVerbs = CoreDut ** open SyntaxDut, ParadigmsDut in {


    lin 

        -- Implicatives 

        manage_to    vp = mkVP (mkV2V (mkV "redden")) it_NP vp;
        forget_to    vp = mkVP (mkVV (mkV "vergeten")) vp;
        refuse_to    vp = mkVP (mkVV (mkV "weigeren" "weigerde" "geweigerd")) vp;
        attempt_to   vp = mkVP (mkVV (mkV "proberen")) vp;
        hesitate_to  vp = mkVP (mkVV (mkV "aarzelen")) vp;

        force_to  np vp = mkVP (mkV2V (mkV "dwingen")) np vp;

        -- Factives

        know_that    s = mkVP (mkVS (mkV "weten" "wist" "geweten")) s;
        forget_that  s = mkVP (mkVS (mkV "vergeten")) s;
        pretend_that s = mkVP (mkVS (mkV "pretenderen")) s; -- TODO doen alsof, voorwenden?

}