# Logitech F710 ROS joy teleop

Dockerized ROS node allowing to control ROS powered mobile robots with Logitech F710 gamepad. More details on ROS node itself and applied velocities in modes can be found in it's [README](./logitech_f710_ros/README.md).

## Setup joy

Connect joy via nano USB receiver and make sure it is in **DirectInput Mode** (switch in front o the pad with letters **D** and **X**, select **D**).

To test if joy works use `jstest /dev/input/js0`.
If the output is:

```
jstest: No such file or directory
```

See `ls /dev/input | grep js` and find your joy number. If it differs apply changes in *compose.*.yaml* and launch file.

## Button mapping

|  Button  |      Function      |
|:--------:|:------------------:|
|   `LB`   |   enable driving   |
|   `RB`   | slow driving mode  |
|   `RT`   |  fast driving mode |

If neither `RB` nor `RT` are pressed robot operates in *normal* driving mode.

To drive robot use sticks.

By default linear `X` and `Y` are held by right stick. Angular `Z` is controlled with left stick.

---
## ROS node API

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

## Docker image

[![Build/Publish Docker Image](https://github.com/husarion/logitech_f710_ros/actions/workflows/build-docker-image.yaml/badge.svg)](https://github.com/husarion/logitech_f710_ros/actions/workflows/build-docker-image.yaml)

| ROS distro | Supported architectures |
| - | - |
| `melodic` | `linux/amd64`, `linux/arm64`, `linux/arm/v7` |
| `noetic` | `linux/amd64`, `linux/arm64` |

Available on [Docker Hub](https://hub.docker.com/r/husarion/logitech-f710/tags)

### Demo

#### Controlling ROSbot 2 with a Logitech F710 gamepad

1. Clone this repo on your ROSbot:

    ```bash
    git clone https://github.com/husarion/logitech_f710_ros.git
    cd logitech_f710_ros/
    ```

2. Create `demo/.env` based on `demo/.env.template` file and modify it if needed (see comments)

    ```bash
    # SBC <> STM32 serial connection. Set:
    # /dev/ttyS1 for ROSbot 2
    # /dev/ttyS4 for ROSbot 2 PRO
    # /dev/ttyAMA0 for ROSbbot 2R
    SERIAL_PORT=/dev/ttyAMA0
    ```

3. Launch on ROSbot

    Go to the `logitech_f710_ros/demo` folder and run:
    
    ```bash
    docker compose -f compose.rosbot.yaml up
    ```
