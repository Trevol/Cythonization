from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension

compiler_directives = {'cdivision': True, 'boundscheck': False}
# compiler_directives = {'cdivision': False, 'boundscheck': True}
files = ['primes_cpp.pyx', 'primes_c.pyx', 'primes_py_cy.py']
cythonized_modules = cythonize(
    files,
    compiler_directives=compiler_directives,
    build_dir='build'
)

setup(ext_modules=cythonized_modules)

# sourcefiles = ['primes_cpp.pyx', 'primes_c.pyx', 'primes_py_cy.py']
#
# extensions = [Extension("primes", sourcefiles)]
#
# setup(
#     ext_modules=cythonize(extensions, build_dir='build')
# )
