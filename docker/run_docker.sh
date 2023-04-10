xhost +local:root
docker run -it --rm --privileged --network=host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --env="QT_X11_NO_MITSHM=1" \
    -e DISPLAY=$DISPLAY bytetrack-openvino /bin/bash

