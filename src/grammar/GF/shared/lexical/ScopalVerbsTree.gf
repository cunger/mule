concrete ScopalVerbsTree of ScopalVerbs = CoreTree ** {

    lin 

        -- Implicatives 

        manage_to    vp = branch1 "manage_to"   vp;
        forget_to    vp = branch1 "forget_to"   ((switch vp) ! Reverse);
        refuse_to    vp = branch1 "refuse_to"   ((switch vp) ! Reverse); 
        attempt_to   vp = branch1 "attempt_to"  vp; 
        hesitate_to  vp = branch1 "hesitate_to" vp;  

        force_to  np vp = branch2 "force_to" np vp; 


        -- Factives

        know_that    s = branch1 "know_that" s; 
        forget_that  s = branch1 "forget_that"  ((switch s) ! Reverse); 
        pretend_that s = branch1 "pretend_that" ((switch s) ! Reverse); 

}