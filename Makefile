MLTON=mlton

.PHONY: typecheck
typecheck:
	make -C src typecheck

.PHONY: clean
clean:
