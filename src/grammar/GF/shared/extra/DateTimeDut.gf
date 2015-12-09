concrete DateTimeDut of DateTime = CoreDut ** open SyntaxDut, ParadigmsDut in {

  lincat

     Weekday      = CN;
     TemporalUnit = CN;
     DateTime     = NP;

  lin

     Monday    = mkCN (mkN "maandag" de);
     Tuesday   = mkCN (mkN "dinsdag" de);
     Wednesday = mkCN (mkN "woensdag" de);
     Thursday  = mkCN (mkN "donderdag" de);
     Friday    = mkCN (mkN "vrijdag" de);
     Saturday  = mkCN (mkN "zaterdag" de);
     Sunday    = mkCN (mkN "zondag" de);

     Minutes   = mkCN (mkN "minuut" de);
     Hours     = mkCN (mkN "uur" het);
     Days      = mkCN (mkN "dag" de);
     Weeks     = mkCN (mkN "week" de);
     Months    = mkCN (mkN "maand" de);
     Years     = mkCN (mkN "jaar" "jaar" het);

     now = mkNP (mkPN "nu");

--   plus  n unit = SyntaxGer.mkAdv in_Prep (mkNP (mkDet (mkDigits n.s)) unit);
--   minus n unit = SyntaxGer.mkAdv in_Prep (mkNP (mkDet (mkDigits n.s)) unit); -- 10 days ago

     next_unit unit = SyntaxDut.mkAdv (mkPrep "") (mkNP (mkCN (mkAP (mkA "volgend")) unit));
     next      day  = SyntaxDut.mkAdv (mkPrep "") (mkNP (mkCN (mkAP (mkA "volgend")) day));

--   date year month day = mkNP (mkPN (year.s ++ "-" ++ month.s ++ "-" ++ day.s));

     on_date d = SyntaxDut.mkAdv on_Prep d;
     on_day  d = SyntaxDut.mkAdv on_Prep (mkNP d);

     yesterday = ParadigmsDut.mkAdv "gisteren";
     today     = ParadigmsDut.mkAdv "vandag";
     tomorrow  = ParadigmsDut.mkAdv "morgen";

}
