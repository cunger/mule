concrete DateTimeGer of DateTime = CoreGer ** open SyntaxGer, ParadigmsGer in {

  lincat

     Weekday      = CN;
     TemporalUnit = CN;
     DateTime     = NP;

  lin

     Monday    = mkCN (mkN "Montag");
     Tuesday   = mkCN (mkN "Dienstag");
     Wednesday = mkCN (mkN "Mittwoch");
     Thursday  = mkCN (mkN "Donnerstag");
     Friday    = mkCN (mkN "Freitag");
     Saturday  = variants { mkCN (mkN "Samstag"); mkCN (mkN "Sonnabend") };
     Sunday    = mkCN (mkN "Sonntag");

     Minutes   = mkCN (mkN "Minute");
     Hours     = mkCN (mkN "Stunde");
     Days      = mkCN (mkN "Tag");
     Weeks     = mkCN (mkN "Woche");
     Months    = mkCN (mkN "Monat");
     Years     = mkCN (mkN "Jahr");

     now = mkNP (mkPN "jetzt");

--   plus  n unit = SyntaxGer.mkAdv in_Prep (mkNP (mkDet (mkDigits n.s)) unit);
--   minus n unit = SyntaxGer.mkAdv in_Prep (mkNP (mkDet (mkDigits n.s)) unit);

     next_unit unit = SyntaxGer.mkAdv accPrep (mkNP (mkCN (mkAP (mkA "nächst")) unit));
     next      day  = SyntaxGer.mkAdv accPrep (mkNP (mkCN (mkAP (mkA "nächst")) day));

--   date year month day = mkNP (mkPN (year.s ++ "-" ++ month.s ++ "-" ++ day.s));

     on_date d = SyntaxGer.mkAdv on_Prep d;
     on_day  d = SyntaxGer.mkAdv on_Prep (mkNP d);

     yesterday = ParadigmsGer.mkAdv "gestern";
     today     = ParadigmsGer.mkAdv "heute";
     tomorrow  = ParadigmsGer.mkAdv "morgen";

}
