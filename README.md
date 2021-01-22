# wasm-math

This is WebAssembly implementation of 4x4 matrix multiplication using SIMD instruction set.

To run code:
 - Build code with any webassembly compiler which can compile from WebAssembly text format (WAT). SIMD has to be enabled on compiler settings.
 - Write or google javascript boilerplate code to run compiled wasm file.
 - In boilerplate code, there must be exported memory (named "memory") size of one page in object named "env"
 - Save matrices in a row-major order to exported memory in f32 format
 - Call exported function "multiply" with arguments of three number (memory byteoffset to matrix A, memory byteoffset to matrix B, memory byteoffset where to save result)
 - Install Chrome/Edge Canary and set flag "WebAssembly SIMD support." Then run on browser.
