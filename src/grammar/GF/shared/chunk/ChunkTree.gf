concrete ChunkTree of Chunk = CoreTree ** {

  lincat Chunk = Str;

  fun 

    chunk_NP   e = branch1 "chunk_NP"  e;

    chunk_VP   p = branch1 "chunk_VP"  p;
    chunk_CN   p = branch1 "chunk_CN"  p;
    chunk_AP   p = branch1 "chunk_AP"  p;
    chunk_Adv  p = branch1 "chunk_Adv" p;

    chunk_Cl  cl = branch1 "chunk_Cl" cl;
    chunk_S    s = branch1 "chunk_S"  s;

}