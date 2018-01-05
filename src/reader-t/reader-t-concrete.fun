functor MkReaderTConcrete
(
  structure Wrapped : MONAD
  type r
) : READER_T_CONCRETE =
struct
  structure Wrapped = Wrapped

  type r = r

  datatype 'a m = ReaderT of r -> 'a Wrapped.m

  fun runReaderT (ReaderT x) = x
end
