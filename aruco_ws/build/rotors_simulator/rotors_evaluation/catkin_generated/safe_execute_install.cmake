execute_process(COMMAND "/home/hemanth/aruco_ws/build/rotors_simulator/rotors_evaluation/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/hemanth/aruco_ws/build/rotors_simulator/rotors_evaluation/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
