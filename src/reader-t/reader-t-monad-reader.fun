functor MkReaderTMonadReader
(
  structure ReaderTConcrete : READER_T_CONCRETE
  structure ReaderTMonad : MONAD
  sharing type ReaderTConcrete.m = ReaderTMonad.m
) : MONAD_READER =
struct
  open ReaderTConcrete

  structure MonadConstraint = ReaderTMonad

  val ask = ReaderT Wrapped.return
  fun local' f (ReaderT m) = ReaderT (fn r => m (f r))
  fun reader f = ReaderT (fn r => Wrapped.return (f r))
end
