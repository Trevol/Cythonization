# distutils: language=c++

from libcpp.vector cimport vector
from cpython.mem cimport PyMem_Malloc, PyMem_Realloc, PyMem_Free


def primes_cpp_reserve(unsigned int nb_primes):
    cdef int n, i
    cdef vector[int] p
    p.reserve(nb_primes)  # allocate memory for 'nb_primes' elements.

    n = 2
    while p.size() < nb_primes:  # size() for vectors is similar to len()
        for i in p:
            if n % i == 0:
                break
        else:
            p.push_back(n)  # push_back is similar to append()
        n += 1

    # Vectors are automatically converted to Python
    # lists when converted to Python objects.
    return p

def primes_cpp_dynamic(unsigned int nb_primes):
    cdef int n, i
    cdef vector[int] p
    #p.reserve(nb_primes)  # allocate memory for 'nb_primes' elements.

    n = 2
    while p.size() < nb_primes:  # size() for vectors is similar to len()
        for i in p:
            if n % i == 0:
                break
        else:
            p.push_back(n)  # push_back is similar to append()
        n += 1

    # Vectors are automatically converted to Python
    # lists when converted to Python objects.
    return p

def primes_cpp_carray(int nb_primes):
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