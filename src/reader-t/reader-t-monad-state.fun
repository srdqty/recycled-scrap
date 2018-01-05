functor MkReaderTMonadState
(
  structure Concrete : READER_T_CONCRETE
  structure Monad : MONAD
  structure MonadTrans : MONAD_TRANS
  structure MonadState : MONAD_STATE
  sharing type Concrete.m = Monad.m = MonadTrans.m
  sharing type Concrete.Wrapped.m = MonadTrans.Wrapped.m = MonadState.m
) : MONAD_STATE =
struct
  open Concrete

  structure MonadConstraint = Monad
  type s = MonadState.s

  val get = MonadTrans.lift MonadState.get
  val put = MonadTrans.lift o MonadState.put
  fun state f = MonadTrans.lift (MonadState.state f)
end
