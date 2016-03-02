# Calling Haskell from Python

This is scraped together from several blog posts.

It shows an example how to build Haskell code (`Test.hs`) and call it from python (`test.py`).

It uses Haskell FFI to export C-style functions and ctypes to call them from Pythons.
Haskell code is built into a dynamic shared library and loaded from CPython.

# Building and running

`make run`

This will run `ghc` with some options

- `-O2` compile wtih optimizations
- `--make` automatically compile imported modules
- `-shared` produes a shared library
- `-dynamic` use dynamic linking for Haskell dependencies (and stdlib)
- `-fPIC` generate relocatable code
- `-o Test.so` output filename
- `-lHSrts_debug-ghc7.10.3` link Haskell runtime
- `Test.hs` our source entry point
- `module_init.c` the C boilerplate to manage Haskell runtime

