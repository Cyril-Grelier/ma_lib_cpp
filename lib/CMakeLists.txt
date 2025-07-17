
if(BUILD_EXAMPLES)
    include(CommonConfig)

    find_program(CLANG_TIDY_EXE NAMES "clang-tidy-19" "clang-tidy")
    if(CLANG_TIDY_EXE)
        message(STATUS "Found clang-tidy: ${CLANG_TIDY_EXE}")
        set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}")
    endif()
endif()

set(LIB_SOURCE_FILES src/ma_lib.cpp)
add_library(ma_lib STATIC ${LIB_SOURCE_FILES})
target_include_directories(ma_lib PUBLIC include)

if(BUILD_EXAMPLES)
    set_target_compile_options(ma_lib)
    set_target_link_options(ma_lib)
endif()