signature MONAD_READER =
sig
  structure Monad : MONAD

  type 'a m
  type r

  sharing type Monad.m = m

  val ask : r m
  val local' : (r -> r) -> 'a m -> 'a m
  val reader : (r -> 'a) -> 'a m
end
