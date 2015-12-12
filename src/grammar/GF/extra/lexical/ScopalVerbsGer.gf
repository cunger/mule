concrete ScopalVerbsGer of ScopalVerb= CoreGer ** open SyntaxGer, ParadigmsGer in {


    lin

        -- Implicatives

        manage_to    = mkVV (mkV "schaffen");
        forget_to    = mkVV (mkV "vergessen" "vergisst" "vergaß" "vergäße" "vergessen");
        attempt_to   = mkVV (mkV "versuchen");

        fail_to      = mkVV (mkV "versagen");
        refuse_to    = mkVV (reflV (mkV "weigern") accusative);
        hesitate_to  = mkVV (mkV "zögern");

    --  force_to  np = mkV2V (mkV "zwingen" "zwingt" "zwang" "zwinge" "gezwungen") accPrep) np vp;

        -- Factives

        know_that    = mkVS (mkV "wissen" "weiß" "wusste" "wisse" "gewusst");
        forget_that  = mkVS (mkV "vergessen" "vergisst" "vergaß" "vergäße" "vergessen");
        pretend_that = mkVS (mkV "vor" (mkV "geben" "gibt" "gab" "gäbe" "gegeben")); -- TODO so tun alob

}
