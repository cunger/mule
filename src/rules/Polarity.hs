module Polarity where

import AbsNaturalLogic


mark :: Marking -> Expression -> Expression
mark m (Leaf   c i _)  = Leaf c i m
mark m (Branch c _ ts) = Branch c m (map (mark m) ts)

revert :: Expression -> Expression
revert (Leaf   c i m)  = Leaf c i (swap m)
revert (Branch c m ts) = Branch c (swap m) (map revert ts)

swap :: Marking -> Marking
swap Plus  = Minus
swap Minus = Plus
swap None  = None
