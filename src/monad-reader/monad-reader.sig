signature MONAD_READER =
sig
  structure MonadConstraint : MONAD

  type 'a m

  sharing type m = MonadConstraint.m

  type r

  val ask : r m
  val local' : (r -> r) -> 'a m -> 'a m
  val reader : (r -> 'a) -> 'a m
end
