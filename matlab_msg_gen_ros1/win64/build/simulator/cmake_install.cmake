# Install script for directory: C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/simulator/msg" TYPE FILE FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/simulator/cmake" TYPE FILE FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/build/simulator/catkin_generated/installspace/simulator-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/devel/include/simulator")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "C:/msys64/mingw64/bin/python3.exe" -m compileall "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/devel/lib/site-packages/simulator")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/site-packages" TYPE DIRECTORY FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/devel/lib/site-packages/simulator")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/build/simulator/catkin_generated/installspace/simulator.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/simulator/cmake" TYPE FILE FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/build/simulator/catkin_generated/installspace/simulator-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/simulator/cmake" TYPE FILE FILES
    "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/build/simulator/catkin_generated/installspace/simulatorConfig.cmake"
    "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/build/simulator/catkin_generated/installspace/simulatorConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/simulator" TYPE FILE FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/include/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/devel/lib/simulator_matlab.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/devel/bin/simulator_matlab.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

