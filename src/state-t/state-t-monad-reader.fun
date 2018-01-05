functor MkStateTMonadReader
(
  structure Concrete : STATE_T_CONCRETE
  structure Monad : MONAD
  structure MonadTrans : MONAD_TRANS
  structure MonadReader : MONAD_READER
  sharing type Concrete.m = Monad.m = MonadTrans.m
  sharing type Concrete.Wrapped.m = MonadTrans.Wrapped.m = MonadReader.m
) : MONAD_READER =
struct
  open Concrete

  structure MonadConstraint = Monad
  type r = MonadReader.r

  val ask = MonadTrans.lift MonadReader.ask
  fun local' f m = StateT (fn s => MonadReader.local' f (runStateT m s))
  fun reader f = MonadTrans.lift (MonadReader.reader f)
end
