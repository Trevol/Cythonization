# cython: language_level=3

from libc.stdlib cimport free

cdef extern from "primes.h":
    int* primes(int numberOfPrimes)

def primes_my_c(numberOfPrimes: int) -> list:
    buf = primes(numberOfPrimes)
    if not buf:
        raise MemoryError()
    r = [i for i in buf[:numberOfPrimes]]
    free(buf)
    return r
