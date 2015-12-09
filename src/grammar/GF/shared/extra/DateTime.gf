abstract DateTime = Core ** {

  cat

     Weekday;

     TemporalUnit;

     DateTime;

  fun

     Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday : Weekday;

     Minutes, Hours, Days, Weeks, Months, Years : TemporalUnit;

     now : DateTime;

     plus  : Int -> TemporalUnit -> Predicate_Adv;  -- in 3 Stunden / Tagen / Wochen / Jahren
     minus : Int -> TemporalUnit -> Predicate_Adv;  -- vor ...

     next_unit : TemporalUnit -> Predicate_Adv;         -- nächste Woche
     next      : Weekday      -> Predicate_Adv;         -- nächsten Mittwoch

     date    : Int -> Int -> Int -> DateTime; -- 2015-11-23

     on_date : DateTime -> Predicate_Adv;
     on_day  : Weekday  -> Predicate_Adv;

     yesterday, today, tomorrow : Predicate_Adv;

}
