default: primes

primes: setup.py primes_py_cy.py *.pyx
	python3 setup.py build_ext --inplace

clean:
	rm -f *.so pyprimes.c $(LIB_DIR)/*.a $(LIB_DIR)/*.o
	rm -r -f ./build