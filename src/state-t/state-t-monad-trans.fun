functor MkStateTMonadTrans
(
  structure StateTConcrete : STATE_T_CONCRETE
) : MONAD_TRANS =
struct
  open StateTConcrete

  fun lift m = StateT (fn s => Wrapped.bind m (fn a => Wrapped.return (a, s)))
end
