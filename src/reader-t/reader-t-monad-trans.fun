functor MkReaderTMonadTrans
(
  structure ReaderTConcrete : READER_T_CONCRETE
) : MONAD_TRANS =
struct
  open ReaderTConcrete

  fun lift m = ReaderT (fn r => Wrapped.bind m (fn a => Wrapped.return a))
end
