include(CommonConfig)

find_program(CLANG_TIDY_EXE NAMES "clang-tidy-19" "clang-tidy")
if(CLANG_TIDY_EXE)
    message(STATUS "Found clang-tidy: ${CLANG_TIDY_EXE}")
    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}")
endif()

add_executable(exemple1 exemple1.cpp)
target_link_libraries(exemple1 PRIVATE ma_lib stdc++)
target_include_directories(exemple1 PRIVATE ${CMAKE_SOURCE_DIR}/lib/include)
set_target_compile_options(exemple1)
set_target_link_options(exemple1)

add_executable(exemple2 exemple2.cpp)
target_link_libraries(exemple2 PRIVATE ma_lib stdc++)
target_include_directories(exemple2 PRIVATE ${CMAKE_SOURCE_DIR}/lib/include)
set_target_compile_options(exemple2)
set_target_link_options(exemple2)
