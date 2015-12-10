concrete DomainEng of Domain = CatEng ** open ParadigmsEng in {

    lin

        flight_N = mkN "flight";
        airport_N = mkN "airport";

        cheap_A = mkA "cheap";
        early_A = mkA "early";
        late_A = mkA "late";

        travel_V = mkV "travel";
        fly_V = mkV "fly";
        shop_V = mkV "shop";

        near_Prep = mkPrep "near";

}
