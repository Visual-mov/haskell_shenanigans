fizz: clean
	ghc ./fizzbuzz.hs

keys: clean
	ghc ./candidate_keys.hs

rpn: clean
	ghc ./rpn.hs

clean:
	rm -f *.o *.hi
	rm -f candidate_keys fizzbuzz rpn