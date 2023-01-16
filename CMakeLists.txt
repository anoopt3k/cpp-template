cmake_minimum_required(VERSION 3.16)
project(cpp-template VERSION 1.0 LANGUAGES CXX)

# —————————————————————————————————————————
# Options
# —————————————————————————————————————————
option(ENABLE_TESTS "Enables XXX tests" ON)

# —————————————————————————————————————————
# Variables
# —————————————————————————————————————————
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(SOURCE_DIR "${PROJECT_SOURCE_DIR}/src/")
set(INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/")
set(TEST_SOURCE_DIR "${PROJECT_SOURCE_DIR}/tests/")
set(TEST_BIN "${PROJECT_NAME}_test")

# —————————————————————————————————————————
# Conan Setup
# —————————————————————————————————————————
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

# —————————————————————————————————————————
# Target for binary
# —————————————————————————————————————————
include_directories(${INCLUDE_DIR})
file(GLOB_RECURSE SOURCES "${SOURCE_DIR}/*.cc" "${SOURCE_DIR}/*.cpp" "${SOURCE_DIR}/*.cxx")
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})

# —————————————————————————————————————————
# create target for test, enable testing, and register a test "RunAllTests"
# —————————————————————————————————————————
if(ENABLE_TESTS)
    enable_testing()
    file(GLOB_RECURSE TEST_SOURCES "${TEST_SOURCE_DIR}/*.cc" "${TEST_SOURCE_DIR}/*.cpp" "${TEST_SOURCE_DIR}/*.cxx")
    add_executable(${TEST_BIN} ${TEST_SOURCES})
    target_link_libraries(${TEST_BIN} ${CONAN_LIBS})
    add_test(NAME RunAllTests WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/bin COMMAND ${TEST_BIN})
endif()