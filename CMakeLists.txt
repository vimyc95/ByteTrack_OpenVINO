cmake_minimum_required(VERSION 3.0.2)
project(bytetrack-openvino)

add_compile_options(-std=c++11)

find_package(OpenCV REQUIRED COMPONENTS)
# find_package(InferenceEngine REQUIRED)
# find_package(ngraph REQUIRED)
find_package(Eigen3 3.3 REQUIRED NO_MODULE)

include_directories(
    ${OpenCV_INCLUDE_DIRS}
    ${PROJECT_SOURCE_DIR}/include
)

file(GLOB C_Source_Files ${PROJECT_SOURCE_DIR}/src/*.cpp)

add_executable(bytetrack_openvino ${C_Source_Files})
target_link_libraries(
    bytetrack_openvino
    # ${InferenceEngine_LIBRARIES}
    # ${NGRAPH_LIBRARIES}
    ${OpenCV_LIBS}
    Eigen3::Eigen
)