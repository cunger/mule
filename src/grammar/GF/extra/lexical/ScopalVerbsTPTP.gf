concrete ScopalVerbsTPTP of ScopalVerbs = CoreTPTP ** {

    lin

        -- Implicatives

        manage_to    vp = app (pred2 "manage_to") vp;
        forget_to    vp = app (pred2 "forget_to") vp;
        attempt_to   vp = app (pred2 "attempt_to") vp;

        fail_to      vp = app (pred2 "fail_to") vp;
        refuse_to    vp = app (pred2 "refuse_to") vp;
        hesitate_to  vp = app (pred2 "hesitate_to") vp;

--      force_to  np vp = app (app (pred3 "force_to") np) vp;


        -- Factives

        know_that    s = app (pred2 "know_that") s;
        forget_that  s = app (pred2 "forget_that") s;
        pretend_that s = app (pred2 "pretend_that") s;

}
