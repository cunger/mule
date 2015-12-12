module ScopalVerbs (rules) where

import AbsAST


rules = [
           "(ComplVV manage_to $1) -> $1"
         , "(UseCl $3 PPos (PredVP $2 (ComplVV forget_to $1) ^ (UseCl $3 PPos (PredVP $2 $1))"
         , "(UseCl $3 PPos (PredVP $2 (ComplVV forget_to $1) -> (UseCl $3 PNeg (PredVP $2 $1))"
         , "(UseCl $3 PPos (PredVP $2 (ComplVV refused_to $1) | (UseCl $3 PPos (PredVP $2 $1))"
         , "(UseCl $3 PPos (PredVP $2 (ComplVV refused_to $1) -> (UseCl $3 PNeg (PredVP $2 $1))"
        ]
