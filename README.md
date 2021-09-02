# Logitech F710 ROS joy teleop

Dockerized ROS node allowing to control robot with Logitech F710 gamepad. More details on ROS node itself and applied velocities in modes can be found in it's [README](./logitech_f710_ros/README.md).

## Setup joy

Connect joy via nano USB receiver and make sure it is in **DirectInput Mode** (switch in front o the pad with letters **D** and **X**, select **D**).

To test if joy works use `jstest /dev/input/js0`.
If the output is:
        
        jstest: No such file or directory

See `ls /dev/input | grep js` and find your joy number. If it differs apply changes in *docker-compose.yaml* and launch file.

## Move robot:

This node will publish values on `cmd_vel` topic with message *geometry_msgs/Twist*.

|  Button  |      Function      |
|:--------:|:------------------:|
|   `LB`   |   enable driving   |
|   `RB`   | slow driving mode  |
|   `RT`   |  fast driving mode |

If neither `RB` nor `RT` are pressed robot operates in *normal* driving mode.

By default joy stick's axes are mapped as follows:
- **right stick** - forward / backward: `cmd_vel` linear `x`
- **right stick** - left / right: `cmd_vel` linear `y`
- **left stick** - left / right: `cmd_vel` angular `z`

## Examples

You can run examples with following commands:

``` bash
cd examples/panther_f710
docker-compose up
```