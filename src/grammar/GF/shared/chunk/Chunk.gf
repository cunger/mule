abstract Chunk = Core ** {

  flags startcat = Chunk;

  cat Chunk;

  fun 

    chunk_NP   : Entity_NP     -> Chunk;

    chunk_VP   : Predicate_VP  -> Chunk;
    chunk_CN   : Predicate_CN  -> Chunk;
    chunk_AP   : Predicate_AP  -> Chunk;
    chunk_Adv  : Predicate_Adv -> Chunk;

    chunk_Cl   : Clause_Cl     -> Chunk;
    chunk_S    : Sentence_S    -> Chunk; 

}