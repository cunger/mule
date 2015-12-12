module Structural (rules) where

import AbsAST


rules = [  "(AdjCN * $1) -> $1"
         , "(AdvVP $1 *) -> $1"
        ]
