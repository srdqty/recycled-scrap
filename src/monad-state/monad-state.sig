signature MONAD_STATE =
sig
  structure MonadConstraint : MONAD

  type 'a m

  sharing type m = MonadConstraint.m

  type s

  val get : s m
  val put : s -> unit m
  val state : (s -> ('a * s)) -> 'a m
end
