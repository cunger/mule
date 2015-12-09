module Darts (rules) where

import Rules


rules = [
          relation2relation    ("V","win_against")  ("V","play_against")
        , relation2relation    ("V","win2")         ("V","participate")
        , relation2relation    ("V","lose2")        ("V","participate")
        , relation2relation    ("V","lose_against") ("V","play_against")
        , existentialClosureE  ("V","win_against")  ("VP","win1")
        , existentialClosureE  ("V","lose_against") ("VP","lose1")
        , existentialClosureX  ("V","win2")         ("VP","win1")
        , existentialClosureX  ("V","lose2")        ("VP","lose1")
        , predicate2predicate  ("AP","Dutch")       ("AP","European")
        , predicate2predicate  ("AP","British")     ("AP","European")
        -- , modPrepNP2modPrepNP  "from" "Netherlands" "Europe"
        -- , modPrepNP2modPrepNP  "from" "England"     "Europe"
        -- , modPrepNP2modAP      "from" "Netherlands" "Dutch"
        -- , modPrepNP2modAP      "from" "England"     "British"
        -- , modAP2modPrepNP      "Dutch"   "from" "Netherlands"
        -- , modAP2modPrepNP      "British" "from" "England"
        -- , entity2type          "Taylor"       "player" False
        -- , entity2type          "VanGerwen"    "player" False
        -- , entity2type          "VanBarneveld" "player" False
        -- , entity2type          "Webster"      "player" False
        -- Taylor -> "player" False [ "British", "excellent" ]
        -- ...
        ]
