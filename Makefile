MLTON=mlton

.PHONY: test
test:
	make -C test test

.PHONY: typecheck
typecheck:
	make -C src typecheck
	make -C test typecheck

.PHONY: clean
clean:
