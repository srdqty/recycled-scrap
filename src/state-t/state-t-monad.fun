functor MkStateTMonad
(
  structure StateTConcrete : STATE_T_CONCRETE
) : MONAD =
struct
  open StateTConcrete

  fun return a = StateT (fn s => Wrapped.return (a, s))

  fun bind m k = StateT (fn s =>
    Wrapped.bind (runStateT m s) (fn (a, s') => runStateT (k a) s'))

  fun op >>= (m, k) = bind m k
end
