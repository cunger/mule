concrete DateTimeEng of DateTime = CoreEng ** open SyntaxEng, ParadigmsEng in {

  lincat

     Weekday      = CN;
     TemporalUnit = CN;
     DateTime     = NP;

  lin

     Monday    = mkCN (mkN "Monday");
     Tuesday   = mkCN (mkN "Tuesday");
     Wednesday = mkCN (mkN "Wednesday");
     Thursday  = mkCN (mkN "Thursday");
     Friday    = mkCN (mkN "Friday");
     Saturday  = mkCN (mkN "Saturday");
     Sunday    = mkCN (mkN "Sunday");

     Minutes   = mkCN (mkN "minute");
     Hours     = mkCN (mkN "hour");
     Days      = mkCN (mkN "day");
     Weeks     = mkCN (mkN "week");
     Months    = mkCN (mkN "month");
     Years     = mkCN (mkN "year");

     now = mkNP (mkPN "now");

--     plus  n unit = SyntaxEng.mkAdv in_Prep (mkNP (mkDet (mkDigits n.s)) unit);
--     minus n unit = SyntaxEng.mkAdv in_Prep (mkNP (mkDet (mkDigits n.s)) unit); -- 10 days ago

     next_unit unit = SyntaxEng.mkAdv (mkPrep "next") (mkNP unit);
     next      day  = SyntaxEng.mkAdv (mkPrep "next") (mkNP day);

--   date year month day = mkNP (mkPN (year.s ++ "-" ++ month.s ++ "-" ++ day.s));

     on_date d = SyntaxEng.mkAdv on_Prep d;
     on_day  d = SyntaxEng.mkAdv on_Prep (mkNP d);

     yesterday = ParadigmsEng.mkAdv "yesterday";
     today     = ParadigmsEng.mkAdv "today";
     tomorrow  = ParadigmsEng.mkAdv "tomorrow";

}
