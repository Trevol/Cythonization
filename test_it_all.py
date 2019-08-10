from primes_c import primes_c
from primes_cpp import primes_cpp_reserve, primes_cpp_dynamic, primes_cpp_carray
from primes_py import primes_py
from primes_py_cy import primes_py_cy

nb_primes = 1000
py_primes = primes_py(nb_primes)
assert (primes_py_cy(nb_primes) == py_primes)
assert (primes_c(nb_primes) == py_primes)
assert (primes_cpp_dynamic(nb_primes) == py_primes)
assert (primes_cpp_reserve(nb_primes) == py_primes)
assert (primes_cpp_carray(nb_primes) == py_primes)