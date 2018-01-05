structure IdentityMonad =
struct
  datatype 'a m = Identity of 'a

  val return = Identity

  fun bind (Identity a) k = k a
end
