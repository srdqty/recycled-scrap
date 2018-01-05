functor MkTest(
  structure MonadState : MONAD_STATE
  structure MonadReader : MONAD_READER
  sharing type MonadState.m = MonadReader.m
  sharing type MonadState.MonadConstraint.m = MonadReader.MonadConstraint.m
  sharing type MonadReader.r = MonadState.s
) =
struct
  structure Monad = MonadState.MonadConstraint

  fun test is ir = Monad.bind MonadReader.ask MonadState.put
end

functor MkReaderTStateT
(
  structure WrappedMonad : MONAD
  structure WrappedMonadState : MONAD_STATE
  sharing type WrappedMonad.m = WrappedMonadState.m
  type r
) =
struct
  local
    structure Concrete = MkReaderTConcrete(
      structure Wrapped = WrappedMonad
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
    structure MonadState = MkReaderTMonadState
    (
      structure Concrete = Concrete
      structure Monad = Monad
      structure MonadTrans = MonadTrans
      structure MonadState = WrappedMonadState
    )
  in
    open Monad
    open MonadTrans
    open MonadReader
    open MonadState
  end
end

functor MkStateTReaderT
(
  structure WrappedMonad : MONAD
  structure WrappedMonadReader : MONAD_READER
  sharing type WrappedMonad.m = WrappedMonadReader.m
  type s
) =
struct
  local
    structure Concrete = MkStateTConcrete(
      structure Wrapped = WrappedMonad
      type s = s
    )
    structure Monad = MkStateTMonad(
      structure StateTConcrete = Concrete
    )
    structure MonadTrans = MkStateTMonadTrans(
      structure StateTConcrete = Concrete
    )
    structure MonadState = MkStateTMonadState(
      structure StateTConcrete = Concrete
      structure StateTMonad = Monad
    )
    structure MonadReader = MkStateTMonadReader
    (
      structure Concrete = Concrete
      structure Monad = Monad
      structure MonadTrans = MonadTrans
      structure MonadReader = WrappedMonadReader
    )
  in
    open Monad
    open MonadTrans
    open MonadState
    open MonadReader
  end
end

structure StateT = MkStateT(
  structure Wrapped = IdentityMonad
  type s = char
)

structure Example1 = MkReaderTStateT(
  structure WrappedMonad = StateT
  structure WrappedMonadState = StateT
  type r = char
)

structure ReaderT = MkReaderT(
  structure Wrapped = IdentityMonad
  type r = char
)

structure Example2 = MkStateTReaderT(
  structure WrappedMonad = ReaderT
  structure WrappedMonadReader = ReaderT
  type s = char
)

val _ = print "lmao"
