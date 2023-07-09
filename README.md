# PX4_Autopilot_Aruco
The repo consisting of Px4 environment with basic drone control, custom spiral control path and Aruco Landing
.....................................................................................................................

A. PX4-Autopilot Simulation Environment Setup
   ..........................................
   The setps includes:
   
   1. Install ubuntu 20.04 with ROS noetic
   2. on terminal: sudo apt update
                   sudo apt upgrade (to update and get all the neccessary system packages)
   3. on terminal: sudo apt install git zip qtcreator cmake build-essential genromfs ninja-build exiftool to install dependencies
                   sudo apt install python3-pip python3-empy python3-toml python3-numpy python3-dev python3-yaml python3-argparse python3-setuptools python3-wheel python3-requests python3-serial python3-                          dateutil python3-pexpect python3-pyserial python3-jinja2 python3-pyparsing
  4. Gitclone PX4 Source Code: git clone https://github.com/PX4/PX4-Autopilot.git --recursive
  5. Open the directory: cd PX4-Autopilot
  6. Build the platform: make px4_sitl_default
  7. succesful installation
  8. To launch a simple simulation of PX$ using gazebo: make px4_sitl gazebo

To change the flight lattitude, longitude, altitude and simulation time : on terminal:
export PX4_HOME_LAT=28.452386
export PX4_HOME_LON=-13.867138
export PX4_HOME_ALT=28.5
make px4_sitl_default jmavsim
this will launch the simulation with the set altitude,latitude,longitude and desired simulation time.

..........................................................................................................
