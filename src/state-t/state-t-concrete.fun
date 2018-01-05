functor MkStateTConcrete
(
  structure Wrapped : MONAD
  type s
) =
struct
  structure Wrapped = Wrapped

  type s = s

  datatype 'a m = StateT of s -> ('a * s) Wrapped.m
end
