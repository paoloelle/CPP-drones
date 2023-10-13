# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "simulator: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isimulator:C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg;-Istd_msgs:C:/Program Files/MATLAB/R2023b/sys/ros1/win64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(simulator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg" NAME_WE)
add_custom_target(_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "simulator" "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(simulator
  "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simulator
)

### Generating Services

### Generating Module File
_generate_module_cpp(simulator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simulator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(simulator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(simulator_generate_messages simulator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg" NAME_WE)
add_dependencies(simulator_generate_messages_cpp _simulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simulator_gencpp)
add_dependencies(simulator_gencpp simulator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simulator_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(simulator
  "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simulator
)

### Generating Services

### Generating Module File
_generate_module_py(simulator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simulator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(simulator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(simulator_generate_messages simulator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/paolo/OneDrive/Documenti/Ricerca@UniPG/drones/matlab_msg_gen_ros1/win64/src/simulator/msg/position3D.msg" NAME_WE)
add_dependencies(simulator_generate_messages_py _simulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simulator_genpy)
add_dependencies(simulator_genpy simulator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simulator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simulator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(simulator_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simulator)
  install(CODE "execute_process(COMMAND \"C:/msys64/mingw64/bin/python3.exe\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simulator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simulator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(simulator_generate_messages_py std_msgs_generate_messages_py)
endif()
