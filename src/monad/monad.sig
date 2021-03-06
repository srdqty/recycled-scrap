signature MONAD =
sig
  type 'a m

  val return : 'a -> 'a m
  val bind : 'a m -> ('a -> 'b m) -> 'b m
  val >>= : ('a m * ('a -> 'b m)) -> 'b m
end
