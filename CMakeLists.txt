cmake_minimum_required(VERSION 3.13)
project(xxbits
        VERSION         0.1.0
        DESCRIPTION     "Bit manipulation"
        LANGUAGES       CXX)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")


###
### OPTIONS
###

option(BUILD_TESTS
        "Build ++bits tests"
        Off)

option(BUILD_DOCS
        "Build ++bits documentation"
        Off)


###
### MAIN LIBRARY SETUP
###

configure_file(
        include/xxbits/version.hxx.in
        include/xxbits/version.hxx)

add_library(xxbits              INTERFACE)
add_library(xxbits::xxbits      ALIAS xxbits)

set_target_properties(xxbits
        PROPERTIES
        CXX_STANDARD            17
        CXX_STANDARD_REQUIRED   On
        CXX_EXTENSIONS          Off
        VERSION                 ${PROJECT_VERSION})

target_compile_features(xxbits
        INTERFACE
        cxx_std_17)


include(GNUInstallDirs)

target_include_directories(xxbits
        INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include/>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

###
### EXTRAS
###

# Test
if (BUILD_TESTS)
    add_subdirectory(3rdparty/doctest/ EXCLUDE_FROM_ALL)
    add_subdirectory(test/)
endif ()

# Docs
if (BUILD_DOCS)
    find_package(Doxygen REQUIRED)
    add_subdirectory(docs/)
endif ()

# Installation
include(xxbitsInstaller)
