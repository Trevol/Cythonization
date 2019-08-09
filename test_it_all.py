from primes_c import primes_c
from primes_cpp import primes_cpp_reserve, primes_cpp_dynamic, primes_cpp_carray
from primes_py import primes_py
from primes_py_cy import primes_py_cy

py_primes = primes_py(1000)
assert (primes_py_cy(1000) == py_primes)
assert (primes_c(1000) == py_primes)
assert (primes_cpp_dynamic(1000) == py_primes)
assert (primes_cpp_reserve(1000) == py_primes)
assert (primes_cpp_carray(1000) == py_primes)