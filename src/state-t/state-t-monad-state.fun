functor MkStateTMonadState
(
  structure StateTConcrete : STATE_T_CONCRETE
  structure StateTMonad : MONAD
  sharing type StateTConcrete.m = StateTMonad.m
) : MONAD_STATE =
struct
  open StateTConcrete

  structure MonadConstraint = StateTMonad

  val get = StateT (fn s => Wrapped.return (s, s))
  fun put s = StateT (fn _ => Wrapped.return ((), s))

  val return = MonadConstraint.return
  fun op >>= (x, y) = MonadConstraint.bind x y
  infixr >>=

  fun state f =
    get >>= (fn s =>
    let val (a, s') = f s in
      put s' >>= (fn _ =>
      return a
    )end)
end
