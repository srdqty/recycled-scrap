functor MkReaderT
(
  structure Wrapped : MONAD
  type r
) =
struct
  local
    structure Concrete = MkReaderTConcrete(
      structure Wrapped = Wrapped
      type r = r
    )
    structure Monad = MkReaderTMonad(
      structure ReaderTConcrete = Concrete
    )
    structure MonadTrans = MkReaderTMonadTrans(
      structure ReaderTConcrete = Concrete
    )
    structure MonadReader = MkReaderTMonadReader(
      structure ReaderTConcrete = Concrete
      structure ReaderTMonad = Monad
    )
  in
    open Monad
    open MonadTrans
    open MonadReader
  end
end
