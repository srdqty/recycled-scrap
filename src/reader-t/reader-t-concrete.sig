signature READER_T_CONCRETE =
sig
  structure Wrapped : MONAD

  type r

  datatype 'a m = ReaderT of r -> 'a Wrapped.m

  val runReaderT : 'a m -> (r -> 'a Wrapped.m)
end
