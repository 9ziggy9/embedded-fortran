CFLAGS = -Wall -Werror -Wconversion -pedantic

all: hello_f.o hello_c.o
	cc -o debug hello_f.o hello_c.o -lgfortran

.PHONY: run
run: all
	./debug_f
	./debug_c

hello_c: hello_c.o
	cc -o debug_c hello_c.o

hello_c.o: hello_c.c
	cc -c hello_c.c $(CFLAGS)

hello_f: hello_f.o
	gfortran -o debug_f hello_f.o $(CFLAGS)

hello_f.o: hello_f.f90
	gfortran -c hello_f.f90

clean:
	rm -rf ./debug *.o ./debug_*
