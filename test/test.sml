functor MkReaderTStateT
(
  structure WrappedMonad : MONAD
  structure WrappedMonadState : MONAD_STATE
  sharing type WrappedMonad.m = WrappedMonadState.m
  type r
) =
struct
  local
    structure MonadReader = MkReaderT(
      structure Wrapped = WrappedMonad
      type r = r
    )
    structure MonadState = MkReaderTMonadState
    (
      structure Concrete = MonadReader
      structure Monad = MonadReader
      structure MonadTrans = MonadReader
      structure MonadState = WrappedMonadState
    )
  in
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
    structure MonadState = MkStateT(
      structure Wrapped = WrappedMonad
      type s = s
    )
    structure MonadReader = MkStateTMonadReader
    (
      structure Concrete = MonadState
      structure Monad = MonadState
      structure MonadTrans = MonadState
      structure MonadReader = WrappedMonadReader
    )
  in
    open MonadState
    open MonadReader
  end
end

structure StateT = MkStateT(
  structure Wrapped = IdentityMonad
  type s = char
)

structure ReaderT = MkReaderT(
  structure Wrapped = IdentityMonad
  type r = char
)

structure ReaderTStateT = MkReaderTStateT(
  structure WrappedMonad = StateT
  structure WrappedMonadState = StateT
  type r = char
)

structure StateTReaderT = MkStateTReaderT(
  structure WrappedMonad = ReaderT
  structure WrappedMonadReader = ReaderT
  type s = char
)

functor MkTest(
  structure MonadState : MONAD_STATE
  structure MonadReader : MONAD_READER
  sharing type MonadState.m = MonadReader.m
  sharing type MonadState.MonadConstraint.m = MonadReader.MonadConstraint.m
  sharing type MonadReader.r = MonadState.s
) =
struct
  structure Monad = MonadState.MonadConstraint

  val (test : unit Monad.m) = Monad.bind MonadReader.ask MonadState.put
end

structure Test1 = MkTest(
  structure MonadState = ReaderTStateT
  structure MonadReader = ReaderTStateT
)

structure Test2 = MkTest(
  structure MonadState = StateTReaderT
  structure MonadReader = StateTReaderT
)

val example1 = Test1.test
val example2 = Test2.test

val ((_, run1) : (unit * char)) = IdentityMonad.runIdentity
  (StateT.runStateT
    (ReaderTStateT.runReaderT example1 #"A") #"B")

val ((_, run2) : (unit * char)) = IdentityMonad.runIdentity
  (ReaderT.runReaderT
    (StateTReaderT.runStateT example2 #"B") #"A")

val _ = (print (Char.toString run1); print "\n")
val _ = (print (Char.toString run2); print "\n")
