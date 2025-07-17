#include "ma_lib.h"

int add(int a, int b) {

    int *ptr = new int[10];
    // Buffer overflow: index 10 is out of bounds (0-9)
    // Sanitizer will detect it at runtime in debug mode
    ptr[10] = 42;
    // Memory leak: ptr is not freed

    return a + b;
}
