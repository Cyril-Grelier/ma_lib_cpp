add_executable(exemple1 exemple1.cpp)
add_executable(exemple2 exemple2.cpp)

target_link_libraries(exemple1 PRIVATE ma_lib)
target_link_libraries(exemple2 PRIVATE ma_lib)

target_include_directories(exemple1 PRIVATE ${CMAKE_SOURCE_DIR}/lib/)
target_include_directories(exemple2 PRIVATE ${CMAKE_SOURCE_DIR}/lib/)
