# Build the app which supports ALSA, using the HAL

include_directories(include)
file(GLOB MY_SOURCES "src/*.c")
add_executable(finddot ${MY_SOURCES})

# Make use of the HAL library
target_link_libraries(finddot LINK_PRIVATE gpiod)
target_link_libraries(finddot LINK_PRIVATE hal)
target_link_libraries(finddot LINK_PRIVATE lcd)
target_link_libraries(finddot LINK_PRIVATE lgpio)

# PTHREAD support
find_package(Threads REQUIRED)
target_link_libraries(finddot LINK_PRIVATE Threads::Threads)

# Copy executable to final location (change `beat_box` to project name as needed)
add_custom_command(TARGET finddot POST_BUILD 
  COMMAND "${CMAKE_COMMAND}" -E copy 
     "$<TARGET_FILE:finddot>"
     "~/cmpt433/public/myApps/finddot" 
  COMMENT "Copying ARM executable to public NFS directory")

find_library(GPIOD_LIBRARY gpiod)       
target_link_libraries(finddot LINK_PRIVATE gpiod)

