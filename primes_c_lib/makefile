CC = gcc

default: libprimes.a

libprimes.a: primes.o
	ar rcs $@ $^
    
primes.o: primes.c primes.h
	$(CC) -c $<

clean:
	rm *.o *.a
