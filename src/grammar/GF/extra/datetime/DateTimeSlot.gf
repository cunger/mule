concrete DateTimeSlot of DateTime = CoreSlot ** {

lincat

     Weekday      = Str;
     TemporalUnit = Str;
     DateTime     = Str;

  lin

     Monday    = "Monday";
     Tuesday   = "Tuesday";
     Wednesday = "Wednesday";
     Thursday  = "Thursday";
     Friday    = "Friday";
     Saturday  = "Saturday";
     Sunday    = "Sunday";

     Minutes   = "min";
     Hours     = "h";
     Days      = "day";
     Weeks     = "week";
     Months    = "month";
     Years     = "year";

     now = "now";

     plus  n unit = "now" ++ "+" ++ n.s ++ unit;
     minus n unit = "now" ++ "-" ++ n.s ++ unit;

     next_unit unit = fillSlot "date" (unit ++ "(now) + 1");
     next      day  = fillSlot "date" ("next(" ++ day  ++ ")");

     date year month day = year.s ++ "-" ++ month.s ++ "-" ++ day.s;

     on_date d = fillSlot "date" d;
     on_day  d = fillSlot "date" d;

     yesterday = fillSlot "date" "day(now) - 1";
     today     = fillSlot "date" "day(now)";
     tomorrow  = fillSlot "date" "day(now) + 1";

}
