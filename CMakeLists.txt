cmake_minimum_required(VERSION 3.16)
project(cpp-template VERSION 1.0 LANGUAGES CXX)

# —————————————————————————————————————————
# find 3rd party dependencies
# —————————————————————————————————————————
# find_package(fmt CONFIG REQUIRED)
# find_package(Catch2 CONFIG REQUIRED)

# —————————————————————————————————————————
# Variables
# —————————————————————————————————————————
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(SOURCE_DIR "${PROJECT_SOURCE_DIR}/src/")
set(INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/")

# —————————————————————————————————————————
# Target for binary
# —————————————————————————————————————————
include_directories(${INCLUDE_DIR})
file(GLOB_RECURSE SOURCES "${SOURCE_DIR}/*.cc" "${SOURCE_DIR}/*.cpp" "${SOURCE_DIR}/*.cxx")
add_executable(${PROJECT_NAME} ${SOURCES})

# —————————————————————————————————————————
# create target for test, enable testing, and register a test "RunAllTests"
# —————————————————————————————————————————
add_executable(run_tests tests/tests.cpp)
#target_link_libraries(run_tests PRIVATE hellolib Catch2::Catch2)

enable_testing()
add_test(RunAllTests run_tests)