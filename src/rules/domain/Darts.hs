module Darts (rules) where

import Rules


rules = [ relation2relation    "win_against"  "play_against"
        , relation2relation    "win2"         "participate"
        , relation2relation    "lose2"        "participate"
        , relation2relation    "lose_against" "play_against"
        , relation2predicate   "win_against"  "win1"
        , relation2predicate   "lose_against" "lose1"
        , predicate2predicateE "win1"         "win_against"
        , predicate2predicateX "win1"         "win2"
        , predicate2predicateE "lose1"        "lose_against"
        , predicate2predicateX "lose1"        "lose2"
        , modAP2modAP          "Dutch"        "European"
        , modAP2modAP          "British"      "European"
        , modPrepNP2modPrepNP  "from" "Netherlands" "Europe"
        , modPrepNP2modPrepNP  "from" "England"     "Europe"
        , modPrepNP2modAP      "from" "Netherlands" "Dutch"
        , modPrepNP2modAP      "from" "England"     "British"
        , modAP2modPrepNP      "Dutch"   "from" "Netherlands"
        , modAP2modPrepNP      "British" "from" "England"
        , entity2type          "Taylor"       "player" False
        , entity2type          "VanGerwen"    "player" False
        , entity2type          "VanBarneveld" "player" False
        , entity2type          "Webster"      "player" False
        -- Taylor -> "player" False [ "British", "excellent" ]
        -- ...
        ]
