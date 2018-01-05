signature MONAD_TRANS =
sig
  structure Wrapped : MONAD

  type 'a m

  val lift : 'a Wrapped.m -> 'a m
end
