CFLAGS = -Wall -Werror -Wconversion -pedantic

all: hello_f.o hello_c.o
	cc -o debug hello_f.o hello_c.o -lgfortran

hello_c.o: hello_c.c
	cc -c hello_c.c $(CFLAGS)

hello_f.o: hello_f.f90
	gfortran -c hello_f.f90

clean:
	rm -rf ./debug *.o ./debug_*
