functor MkStateTConcrete
(
  structure Wrapped : MONAD
  type s
) : STATE_T_CONCRETE =
struct
  structure Wrapped = Wrapped

  type s = s

  datatype 'a m = StateT of s -> ('a * s) Wrapped.m

  fun runStateT (StateT x) = x
end
