# Logitech F710 ROS joy teleop

Dockerized ROS node allowing to control robot with Logitech F710 gamepad. More details on ROS node itself and applied velocities in modes can be found in it's [README](./logitech_f710_ros/README.md).

## Setup joy

Connect joy via nano USB receiver and make sure it is in **DirectInput Mode** (switch in front o the pad with letters **D** and **X**, select **D**).

To test if joy works use `jstest /dev/input/js0`.
If the output is:
        
        jstest: No such file or directory

See `ls /dev/input | grep js` and find your joy number. If it differs apply changes in *docker-compose.yaml* and launch file.

## Button mapping

|  Button  |      Function      |
|:--------:|:------------------:|
|   `LB`   |   enable driving   |
|   `RB`   | slow driving mode  |
|   `RT`   |  fast driving mode |

If neither `RB` nor `RT` are pressed robot operates in *normal* driving mode.

To drive robot use sticks.

By default linear `X` and `Y` are held by right stick. Angular `Z` is controlled with left stick.

## Examples

You can run examples with following commands:

``` bash
cd examples/panther_f710
docker-compose up
```

---
# ROS node API

ROS node is translating `/joy` topic to `/cmd_vel` topic.


### Publish

- `/cmd_vel` *(geometry_msgs/Twist)*

### Subscribe

- `/joy` *(sensor_msgs/Joy)*

### Parameters

Following parameters change joystick axes mapped to given robot axes of freedom. For more information about parameter values refer to joy package [wiki page](http://wiki.ros.org/joy#Logitech_Wireless_Gamepad_F710_.28DirectInput_Mode.29).

- `~axis_linear_x` *(int, default: 3)* 
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

