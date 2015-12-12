module Darts (rules) where

import AbsAST


rules = [  "win_against_V2 << play_against_V2"
         , "lose_against_V2 << play_against_V2"
         , "win_V | lose_V"
         , "win_against_V2 | lose_against_V2"
         , "Dutch_A -> European_A"
        ]
