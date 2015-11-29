abstract DateTime = {

  cat

     Weekday;

     TemporalUnit;

     DateTime;

  fun

     Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday : Weekday;

     Minute, Hour , Day, Week, Month, Year : TemporalUnit;

     now : DateTime;

     plus  : Integer -> TemporalUnit -> Predicate_Adv;  -- in 3 Stunden / Tagen / Wochen / Jahren
     minus : Integer -> TemporalUnit -> Predicate_Adv;  -- vor ...
     next  : TemporalUnit -> Predicate_Adv;             -- nächste Woche
     next_day : Weekday -> Predicate_Adv;               -- nächsten Mittwoch

     date  : Integer -> Integer -> Integer -> DateTime; -- 2015-11-23

     on_date : DateTime -> Predicate_Adv;
     on_day  : Weekday  -> Predicate_Adv;

     yesterday, today, tomorrow : Predicate_Adv;

}
