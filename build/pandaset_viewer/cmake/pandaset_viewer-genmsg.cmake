# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pandaset_viewer: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ipandaset_viewer:/home/ee904/Pandaset/src/pandaset_viewer/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pandaset_viewer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" NAME_WE)
add_custom_target(_pandaset_viewer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pandaset_viewer" "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" "pandaset_viewer/LidarPoint:std_msgs/Header"
)

get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" NAME_WE)
add_custom_target(_pandaset_viewer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pandaset_viewer" "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pandaset_viewer
)
_generate_msg_cpp(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pandaset_viewer
)

### Generating Services

### Generating Module File
_generate_module_cpp(pandaset_viewer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pandaset_viewer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pandaset_viewer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pandaset_viewer_generate_messages pandaset_viewer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_cpp _pandaset_viewer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_cpp _pandaset_viewer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pandaset_viewer_gencpp)
add_dependencies(pandaset_viewer_gencpp pandaset_viewer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pandaset_viewer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pandaset_viewer
)
_generate_msg_eus(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pandaset_viewer
)

### Generating Services

### Generating Module File
_generate_module_eus(pandaset_viewer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pandaset_viewer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pandaset_viewer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pandaset_viewer_generate_messages pandaset_viewer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_eus _pandaset_viewer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_eus _pandaset_viewer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pandaset_viewer_geneus)
add_dependencies(pandaset_viewer_geneus pandaset_viewer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pandaset_viewer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pandaset_viewer
)
_generate_msg_lisp(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pandaset_viewer
)

### Generating Services

### Generating Module File
_generate_module_lisp(pandaset_viewer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pandaset_viewer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pandaset_viewer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pandaset_viewer_generate_messages pandaset_viewer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_lisp _pandaset_viewer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_lisp _pandaset_viewer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pandaset_viewer_genlisp)
add_dependencies(pandaset_viewer_genlisp pandaset_viewer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pandaset_viewer_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pandaset_viewer
)
_generate_msg_nodejs(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pandaset_viewer
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pandaset_viewer
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pandaset_viewer
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pandaset_viewer_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pandaset_viewer_generate_messages pandaset_viewer_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_nodejs _pandaset_viewer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_nodejs _pandaset_viewer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pandaset_viewer_gennodejs)
add_dependencies(pandaset_viewer_gennodejs pandaset_viewer_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pandaset_viewer_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pandaset_viewer
)
_generate_msg_py(pandaset_viewer
  "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pandaset_viewer
)

### Generating Services

### Generating Module File
_generate_module_py(pandaset_viewer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pandaset_viewer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pandaset_viewer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pandaset_viewer_generate_messages pandaset_viewer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/PointSet.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_py _pandaset_viewer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904/Pandaset/src/pandaset_viewer/msg/LidarPoint.msg" NAME_WE)
add_dependencies(pandaset_viewer_generate_messages_py _pandaset_viewer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pandaset_viewer_genpy)
add_dependencies(pandaset_viewer_genpy pandaset_viewer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pandaset_viewer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pandaset_viewer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pandaset_viewer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pandaset_viewer_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pandaset_viewer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pandaset_viewer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pandaset_viewer_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pandaset_viewer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pandaset_viewer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pandaset_viewer_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pandaset_viewer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pandaset_viewer
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pandaset_viewer_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pandaset_viewer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pandaset_viewer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pandaset_viewer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pandaset_viewer_generate_messages_py std_msgs_generate_messages_py)
endif()
