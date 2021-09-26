cmake_minimum_required(VERSION 3.3)
project(xxbits_test CXX)
enable_testing()

add_executable(xxbits_test tests.cxx)
target_link_libraries(xxbits_test
        PRIVATE                 doctest_with_main
        PRIVATE                 xxbits)
set_target_properties(xxbits_test
        PROPERTIES
        CXX_STANDARD            17
        CXX_STANDARD_REQUIRED   On
        CXX_EXTENSIONS          Off)
add_test(Test_xxbits xxbits_test)
