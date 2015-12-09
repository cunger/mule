module Interpretation where

import PGF (Language)
import AbsNaturalLogic


data Interpretation = Interpretation { language   :: Language
                                     , tree       :: Expression
                                     , inferences :: [Expression] }


instance Eq Interpretation where
   i1 == i2 = equiv (tree i1) (tree i2)


equiv :: Expression -> Expression -> Bool
equiv (Leaf   c1 i1 m1)  (Leaf   c2 i2 m2)  = c1 == c2 && i1 == i2 && m1 == m2
equiv (Branch i1 m1 ts1) (Branch i2 m2 ts2) = i1 == i2 && m1 == m2
   && all (\ t -> any (equiv t) ts2) ts1
   && all (\ t -> any (equiv t) ts1) ts2
equiv _ _ = False
