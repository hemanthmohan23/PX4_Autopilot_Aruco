# PX4_Autopilot_Aruco
The repo consisting of Px4 environment with basic drone control, custom spiral control path and Aruco Landing
.....................................................................................................................

A. PX4-Autopilot Simulation Environment Setup
   ..........................................
   The setps includes:
   
   1. Install ubuntu 20.04 with ROS noetic
   2. on terminal: sudo apt update
                   sudo apt upgrade (to update and get all the neccessary system packages)
   3. on terminal:
   4.  sudo apt install git zip qtcreator cmake build-essential genromfs ninja-build exiftool to install dependencies s
   5.  sudo apt install python3-pip python3-empy python3-toml python3-numpy python3-dev python3-yaml python3-argparse python3-setuptools python3-wheel python3-requests python3-serial python3-         dateutil python3-pexpect python3-pyserial python3-jinja2 python3-pyparsing
  6. Gitclone PX4 Source Code: git clone https://github.com/PX4/PX4-Autopilot.git --recursive
  7. Open the directory: cd PX4-Autopilot
  8. Build the platform: make px4_sitl_default
  9. succesful installation
  10. To launch a simple simulation of PX$ using gazebo: make px4_sitl gazebo

To change the flight lattitude, longitude, altitude and simulation time : on terminal:
export PX4_HOME_LAT=28.452386
export PX4_HOME_LON=-13.867138
export PX4_HOME_ALT=28.5
make px4_sitl_default jmavsim
this will launch the simulation with the set altitude,latitude,longitude and desired simulation time.

..........................................................................................................
B. Spiral path implementation
..............................
The python code to execute a beautiful trajectory is saved as: spiral_trajcetory_script.py
For this install mavsdk and then execute this script
This code will send control signals to the drone and execute spiral trajectory

python script: 
import math
import time
from mavsdk import System
from mavsdk import PositionNedYaw


def calculate_position(radius, frequency, time):
    x = radius * math.sin(2 * math.pi * frequency * time)
    y = velocity_f * time
    z = radius * math.cos(2 * math.pi * frequency * time)
    return x, y, z


def calculate_velocity(velocity_t, frequency, time):
    vx = velocity_t * math.sin(2 * math.pi * frequency * time)
    vy = velocity_f
    vz = velocity_t * math.cos(2 * math.pi * frequency * time)
    return vx, vy, vz


radius = 5.0  # Radius of the spiral
frequency = 1.0  # Number of rotations per second
velocity_f = 1.0  # Forward velocity of the drone
velocity_t = 1.0  # Tangential velocity of the drone


total_time = 10.0  # seconds


command_interval = 0.1  # seconds


num_commands = int(total_time / command_interval)


with System() as drone:

    
    drone.connect(system_address="udp://:14540")

   
    drone.action.arm()

    
    for i in range(num_commands):
        time.sleep(command_interval)  l

        current_time = i * command_interval

        
        x, y, z = calculate_position(radius, frequency, current_time)

        
        vx, vy, vz = calculate_velocity(velocity_t, frequency, current_time)

        
        position_cmd = PositionNedYaw(x, y, -z, 0.0)

        
        position_cmd.set_velocity(vx, vy, vz)

        
        drone.offboard.set_position_ned(position_cmd)

    
    drone.action.disarm()

print("Spiral trajectory completed.")

......................................................................................................
