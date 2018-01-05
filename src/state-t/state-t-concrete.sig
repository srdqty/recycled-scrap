signature STATE_T_CONCRETE =
sig
  structure Wrapped : MONAD

  type s

  datatype 'a m = StateT of s -> ('a * s) Wrapped.m

  val runStateT : 'a m -> (s -> ('a * s) Wrapped.m)
end
