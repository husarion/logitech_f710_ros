# Logitech F710 ROS joy teleop

ROS node translating ROS `/joy` topic information to `/cmd_vel` topic.

## ROS API
### Publish

- `/cmd_vel` *(geometry_msgs/Twist)*

### Subscribe

- `/joy` *(sensor_msgs/Joy)*

### Parameters

Following parameters change joystick axes mapped to given robot axes of freedom. For more information about parameter values refer to joy package [wiki page](http://wiki.ros.org/joy#Logitech_Wireless_Gamepad_F710_.28DirectInput_Mode.29).

- `~axis_linear_x` *(int, default: 1)* 
- `~axis_linear_y` *(int, default: 2)*
- `~axis_angular_z` *(int, default: 0)*

Robot can be operated at 3 scales of speed depending on pressed buttons. Values in those parameters are m/s for linear movement and rad/s for angular movement.

- `~slow_linear_x` *(double, default: 0.1)*
- `~slow_linear_y` *(double, default: 0.1)*
- `~slow_angular_z` *(double, default: 0.1)*

- `~normal_linear_x` *(double, default: 0.5)*
- `~normal_linear_y` *(double, default: 0.5)*
- `~normal_angular_z` *(double, default: 0.5)*

- `~fast_linear_x` *(double, default: 2.0)*
- `~fast_linear_y` *(double, default: 2.0)*
- `~fast_angular_z` *(double, default: 2.0)*

## Button mapping

|  Button  |      Function      |
|:--------:|:------------------:|
|   `LB`   |   enable driving   |
|   `RB`   | slow driving mode  |
|   `RT`   |  fast driving mode |

If neither `RB` nor `RT` are pressed robot operates in *normal* driving mode.

To drive robot use sticks.