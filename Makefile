MLTON=mlton

.PHONY: nix-test
nix-test:
	nix-shell --pure shell.nix --run 'make test'

.PHONY: test
test:
	make -C test test

.PHONY: nix-typecheck
nix-typecheck:
	nix-shell --pure shell.nix --run 'make typecheck'

.PHONY: typecheck
typecheck:
	make -C src typecheck
	make -C test typecheck

.PHONY: clean
clean:
