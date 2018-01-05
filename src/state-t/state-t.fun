functor MkStateT
(
  structure Wrapped : MONAD
  type s
) =
struct
  local
    structure Concrete = MkStateTConcrete(
      structure Wrapped = Wrapped
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
  in
    open Monad
    open MonadTrans
    open MonadState
  end
end
