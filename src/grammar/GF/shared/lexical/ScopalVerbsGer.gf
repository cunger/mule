concrete ScopalVerbsGer of ScopalVerbs = CoreGer ** open SyntaxGer, ParadigmsGer in {


    lin 

        -- Implicatives 

        manage_to    vp = mkVP (mkVV (mkV "schaffen")) vp;
        forget_to    vp = mkVP (mkVV (mkV "vergessen" "vergisst" "vergaß" "vergäße" "vergessen")) vp;
        refuse_to    vp = mkVP (mkVV (reflV (mkV "weigern") accusative)) vp;
        attempt_to   vp = mkVP (mkVV (mkV "versuchen")) vp;
        hesitate_to  vp = mkVP (mkVV (mkV "zögern")) vp;

        force_to  np vp = mkVP (mkV2V (mkV "zwingen" "zwingt" "zwang" "zwinge" "gezwungen") accPrep) np vp;

        -- Factives

        know_that    s = mkVP (mkVS (mkV "wissen" "weiß" "wusste" "wisse" "gewusst")) s;
        forget_that  s = mkVP (mkVS (mkV "vergessen" "vergisst" "vergaß" "vergäße" "vergessen")) s;
        pretend_that s = mkVP (mkVS (mkV "vor" (mkV "geben" "gibt" "gab" "gäbe" "gegeben"))) s; -- TODO so tun als ob

}