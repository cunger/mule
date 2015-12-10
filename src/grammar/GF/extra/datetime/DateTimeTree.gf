concrete DateTimeTree of DateTime = CoreTree ** {

  lincat

     Weekday      = Marking => Str;
     TemporalUnit = Marking => Str;
     DateTime     = Marking => Str;

  lin

     Monday    = leaf "NP" "Monday";
     Tuesday   = leaf "NP" "Tuesday";
     Wednesday = leaf "NP" "Wednesday";
     Thursday  = leaf "NP" "Thursday";
     Friday    = leaf "NP" "Friday";
     Saturday  = leaf "NP" "Saturday";
     Sunday    = leaf "NP" "Sunday";

     Minutes   = leaf "Unit" "minutes";
     Hours     = leaf "Unit" "hours";
     Days      = leaf "Unit" "days";
     Weeks     = leaf "Unit" "weeks";
     Months    = leaf "Unit" "months";
     Years     = leaf "Unit" "years";

     now = leaf "DateTime" "now";

     plus  n unit = branch2 "plus"  (lift n.s) unit;
     minus n unit = branch2 "minus" (lift n.s) unit;

     next_unit unit = branch1 "next" unit;
     next      day  = branch1 "next" day;

     date year month day = leaf "Date" (year.s ++ "-" ++ month.s ++ "-" ++ day.s);

     on_date d = branch1 "date" d;
     on_day  d = branch1 "date" d;

     yesterday = leaf "DateTime" "yesterday";
     today     = leaf "DateTime" "today";
     tomorrow  = leaf "DateTime" "tomorrow";

}
