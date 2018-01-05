functor MkRunTest(
  structure MonadState : MONAD_STATE
  structure MonadReader : MONAD_READER
  sharing type MonadState.m = MonadReader.m
) =
struct
  val op >>= = MonadState.MonadConstraint.>>=
  infix >>=

  val ask = MonadReader.ask
  val put = MonadState.put

  fun test is ir = ask ir >>= put is
end
