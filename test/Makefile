MLTON=mlton

.PHONY: test
test:
	$(MLTON) test.mlb
	./test

.PHONY: typecheck
typecheck:
	$(MLTON) -stop tc test.mlb

.PHONY: clean
clean:
