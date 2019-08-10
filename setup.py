from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension

# compiler_directives = {'cdivision': True, 'boundscheck': False}
# # compiler_directives = {'cdivision': False, 'boundscheck': True}
# files = ['primes_cpp.pyx', 'primes_c.pyx', 'primes_py_cy.py']
# cythonized_modules = cythonize(
#     files,
#     compiler_directives=compiler_directives,
#     build_dir='build'
# )
# setup(ext_modules=cythonized_modules)

######################################

compiler_directives = {'cdivision': True, 'boundscheck': False}

primes_cpp_extension = Extension(
    name="primes_cpp",
    sources=['primes_cpp.pyx'],
    # libraries=["primes"],
    # library_dirs=["primes_c_lib"],
    # include_dirs=["primes_c_lib"]
)
primes_c_extension = Extension(
    name="primes_c",
    sources=['primes_c.pyx'],
    # libraries=["primes"],
    # library_dirs=["primes_c_lib"],
    # include_dirs=["primes_c_lib"]
)
primes_py_cy_extension = Extension(
    name="primes_py_cy",
    sources=['primes_py_cy.py'],
    # libraries=["primes"],
    # library_dirs=["primes_c_lib"],
    # include_dirs=["primes_c_lib"]
)
primes_my_c_extension = Extension(
    name="primes_my_c",
    sources=["primes_my_c.pyx"],
    libraries=["primes"],
    library_dirs=["primes_c_lib"],
    include_dirs=["primes_c_lib"]
)
setup(
    name="primes",
    ext_modules=cythonize([primes_cpp_extension, primes_c_extension, primes_py_cy_extension, primes_my_c_extension], compiler_directives=compiler_directives, build_dir='build')
)
