SRC = $(wildcard *.hs)
EXECUTABLES = $(SRC:.hs=)

all: $(EXECUTABLES)
	
%: %.hs
	mkdir -p ./bin
	-ghc -o "./bin/$@" $^

clean:
	rm -f *.o *.hi
	rm -r ./bin