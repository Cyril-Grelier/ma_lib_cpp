# ma_lib_cpp

Simple example project to build a lib and import it in another project (https://github.com/Cyril-Grelier/ma_lib_cpp_test_call).

When working on files in examples, edit ./CMakeLists.txt :

```cmake
# change the OFF to ON
option(BUILD_EXAMPLES "Build examples" OFF)
option(BUILD_EXAMPLES "Build examples" ON)
```

Don't publish it with this option on ON as the sanitizer could have side effects when running (printing AddressSanitizer:DEADLYSIGNAL again and again).

When working on tests, edit ./CMakeLists.txt (the build time is far longer) :

```cmake
# change the OFF to ON
option(BUILD_TESTS "Build tests" OFF)
option(BUILD_TESTS "Build tests" ON)
```
