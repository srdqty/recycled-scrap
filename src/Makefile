MLTON=mlton

.PHONY: typecheck
typecheck:
	make -C identity-monad typecheck
	make -C monad typecheck
	make -C monad-reader typecheck
	make -C monad-state typecheck
	make -C monad-trans typecheck
	make -C state-t typecheck

.PHONY: clean
clean:
