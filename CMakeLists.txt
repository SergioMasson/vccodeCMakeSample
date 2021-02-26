cmake_minimum_required(VERSION 3.18.0)
project(vcpkgSample VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(vcpkgSample main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

include(CPack)
include(cmake/FindNvidiaPhysx.cmake)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

target_compile_features(vcpkgSample PRIVATE cxx_std_17)
target_link_libraries(vcpkgSample PRIVATE NvidiaPhysxLibrary)
