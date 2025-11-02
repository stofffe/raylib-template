#
# Project and variables setup
#

cmake_minimum_required(VERSION 3.10)
project(RaylibTemplate)

set(CMAKE_CXX_STANDARD 17)                  # cpp version
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)       # export build/[debug/release]/compile_commands.json, this file can be copied into root for clangd LSP

add_executable(${PROJECT_NAME}
    src/main.cpp
)

#
# Libraries
#

# run cmakelists.txt in these folders
add_subdirectory(vendor/raylib-5.5)

# link against the generated libs above
target_link_libraries(${PROJECT_NAME} PRIVATE
    raylib                                  # name is defined in vendor/raylib-5.5/CMakeLists.txt
)

# include files
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/include/raylib/src
)

#
# Assets
#

# copy assets folder to executable position
add_custom_command(
    TARGET ${PROJECT_NAME} 
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/assets $<TARGET_FILE_DIR:${PROJECT_NAME}>/assets
)
