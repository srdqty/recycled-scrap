# Recycled Scrap

```
nix-shell --pure shell.nix --run make typecheck
```

Scrap your type classes and recycle them as modules? ¯\\_(ツ)_/¯

http://www.haskellforall.com/2012/05/scrap-your-type-classes.html

An experiment writing monad transformers and maybe other parts of the haskell
typeclass hierarchy in Standard ML.

# Notes

I wrote the StateT monad transformer in such a weird way because I wanted to be
able to reuse components and rely on minimal constraints when I add "instances"
after the fact. We'll see if that ends up working out when I try to do that
later.