MLTON=mlton

.PHONY: typecheck
typecheck:
	$(MLTON) -stop tc identity-monad.mlb
	$(MLTON) -stop tc test/test.mlb

.PHONY: clean
clean:
