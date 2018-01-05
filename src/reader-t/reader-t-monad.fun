functor MkReaderTMonad
(
  structure ReaderTConcrete : READER_T_CONCRETE
) : MONAD =
struct
  open ReaderTConcrete

  fun return a = ReaderT (fn r => Wrapped.return a)

  fun bind m k = ReaderT (fn r =>
    Wrapped.bind (runReaderT m r) (fn a => runReaderT (k a) r))

  fun op >>= (m, k) = bind m k
end
