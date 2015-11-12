module Pipeline
     ( process ) where 

import Inferences

import PGF 

import ErrM
import ParTree
import PrintTree


-- Pipeline: 
-- Sentence String 
   --GF:parse--> AST 
   --GF:lin--> Tree String 
   --BNFC:parse--> Tree 
   --runMarking--> Tree 
   --drawInferences --> Tree
   --BNFC:print--> Tree String 
   --GF:parse--> AST 
   --GF:lin--> Sentence String

process :: PGF -> Language -> String -> [String] 
process pgf l_tree str = 
   case parseAllLang pgf (startCat pgf) str of 
        ((l,(t:_)):_) -> let str = linearize pgf l_tree t
                         in  case pTree $ myLexer $ str of
                               Ok tree -> let trees = drawInferences tree  
                                              asts  = concat $ map ((parse pgf l_tree (startCat pgf)) . printTree) trees
                                              strs  = map (linearize pgf l) asts
                                          in  ["=",str] ++ ["-->"] ++ map printTree trees ++ ["="] ++ strs
                               _       -> ["--> BNF grammar does not cover: " ++ linearize pgf l_tree t]    
        _             -> ["--> No parses."] 


---- TODO 

--selectRandom :: RandomGen g => [a] -> g -> (a, g)
--selectRandom list rnd =
--  let
--    (rndNum,newRnd) = randomR (0,(length list - 1)) rnd
--    elem = list!!rndNum
--  in
--    (elem, newRnd)

--generate :: RandomGen g => PGF -> g -> (String,g)
--generate pgf rnd =
--  let
--    gen = generateRandom rnd pgf (startCat pgf)
--    (lang,newRnd) = (selectRandom (languages pgf) rnd)
--    s = linearize pgf lang (head gen)
--  in
--    (s,newRnd)
