# wasm-math

This is WebAssembly implementation of 4x4 matrix multiplication using SIMD instruction set.

To run code:
 - Build code with any webassembly compiler which can compile from WebAssembly text format (WAT). SIMD and multivalue has to be enabled on compiler settings.
 - Write or google javascript broilerplate code to run compiled wasm file.
 - Call exported function "multiply" with arguments of 32 numbers (2 x 16, two column major ordered 4x4 matrices)
 - Install Google/Edge canary and set flag "WebAssembly SIMD support." Then run on browser.
