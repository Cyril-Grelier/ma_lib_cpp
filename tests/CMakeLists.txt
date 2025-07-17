CPMAddPackage("gh:catchorg/Catch2@3.8.1")

add_executable(test_ma_lib test_ma_lib.cpp)

target_include_directories(test_ma_lib PRIVATE
    ${CMAKE_SOURCE_DIR}/lib/include
)

target_link_libraries(test_ma_lib PRIVATE
    ma_lib
    Catch2::Catch2WithMain
    stdc++
    m
)

target_compile_features(test_ma_lib PRIVATE cxx_std_17)

enable_testing()
add_test(NAME test_ma_lib COMMAND test_ma_lib)
