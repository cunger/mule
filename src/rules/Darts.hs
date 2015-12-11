module Darts (rules) where

import AbsAST


rules = [  "win_V << play_V"
         , "lose_V << play_V"
         , "Dutch_A -> European_A"
         , "player_N | match_N"
        ]


flights = [ "(AdvVP (UseV shop_V) (PrepNP in_Prep *)) >> (AdvVP (UseV travel_V) (PrepNP to_Prep *))" ]
