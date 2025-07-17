#include <iostream>
#include <ma_lib.h>

int main() {
    int result = add(2, 3);
    std::cout << "result : " << result << std::endl;

    int *ptr = new int[10];
    // Buffer overflow: index 10 is out of bounds (0-9)
    // Sanitizer will detect it at runtime in debug mode
    ptr[10] = 42;
    // Memory leak: ptr is not freed

    return 0;
}
