incomplete concrete ChunkI of Chunk = CoreI ** open Syntax in {

  lincat Chunk = Str;

  lin 

    chunk_NP   e = (mkUtt e).s; 

    chunk_VP   p = (mkUtt p).s; 
    chunk_CN   p = (mkUtt p).s; 
    chunk_AP   p = (mkUtt p).s; 
    chunk_Adv  p = (mkUtt p).s; 

    chunk_Cl  cl = (mkUtt cl).s;
    chunk_S    s = (mkUtt s).s; 

}