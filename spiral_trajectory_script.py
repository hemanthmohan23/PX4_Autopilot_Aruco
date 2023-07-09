import math
import time

# Function to calculate the position based on time
def calculate_position(radius, frequency, time):
    x = radius * math.sin(2 * math.pi * frequency * time)
    y = velocity_f * time
    z = radius * math.cos(2 * math.pi * frequency * time)
    return x, y, z

# Function to calculate the velocity based on time
def calculate_velocity(velocity_t, frequency, time):
    vx = velocity_t * math.sin(2 * math.pi * frequency * time)
    vy = velocity_f
    vz = velocity_t * math.cos(2 * math.pi * frequency * time)
    return vx, vy, vz

# Set the parameters for the trajectory
radius = 5.0  # Radius of the spiral
frequency = 1.0  # Number of rotations per second
velocity_f = 1.0  # Forward velocity of the drone
velocity_t = 1.0  # Tangential velocity of the drone

# Set the total duration of the trajectory
total_time = 10.0  # seconds

# Set the time interval between commands
command_interval = 0.1  # seconds

# Calculate the number of commands to send
num_commands = int(total_time / command_interval)

# Send the commands to the drone
for i in range(num_commands):
    time.sleep(command_interval)  # Wait for the command interval

    current_time = i * command_interval

    # Calculate the position based on time
    x, y, z = calculate_position(radius, frequency, current_time)

    # Calculate the velocity based on time
    vx, vy, vz = calculate_velocity(velocity_t, frequency, current_time)

    # Send the position and velocity commands to the drone
    print("Command {}: Position = ({}, {}, {}), Velocity = ({}, {}, {})".format(
        i+1, x, y, z, vx, vy, vz))

    # You can send the commands to the drone using the appropriate API or interface

print("Spiral trajectory completed.")
