PRIMES_C_LIB = primes_c_lib

default: primes

primes: setup.py primes_py_cy.py *.pyx
	make -C $(PRIMES_C_LIB) libprimes.a && python3 setup.py build_ext --inplace

clean:
	rm -f *.so pyprimes.c $(LIB_DIR)/*.a $(LIB_DIR)/*.o
	rm -r -f ./build