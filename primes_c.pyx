# cython: language_level=3
from cpython.mem cimport PyMem_Malloc, PyMem_Realloc, PyMem_Free

def primes_c(int nb_primes):
    cdef int n, i, len_p
    cdef int *p = <int *> PyMem_Malloc(nb_primes * sizeof(int))
    if not p:
        raise MemoryError()
    try:
        len_p = 0  # The current number of elements in p.
        n = 2
        while len_p < nb_primes:
            # Is n prime?
            for i in p[:len_p]:
                if n % i == 0:
                    break

            # If no break occurred in the loop, we have a prime.
            else:
                p[len_p] = n
                len_p += 1
            n += 1

        # Let's return the result in a python list:
        result_as_list  = [prime for prime in p[:len_p]]
        return result_as_list
    finally:
        PyMem_Free(p)

#def primes_c(int nb_primes):
#    cdef int n, i, len_p
#    cdef int *ptt = <int *> PyMem_Malloc(nb_primes * sizeof(int))
#
#    cdef int p[1000]
#    if nb_primes > 1000:
#        nb_primes = 1000
#
#    len_p = 0  # The current number of elements in p.
#    n = 2
#    while len_p < nb_primes:
#        # Is n prime?
#        for i in p[:len_p]:
#            if n % i == 0:
#                break
#
#        # If no break occurred in the loop, we have a prime.
#        else:
#            p[len_p] = n
#            len_p += 1
#        n += 1
#
#    # Let's return the result in a python list:
#    result_as_list  = [prime for prime in p[:len_p]]
#    return result_as_list