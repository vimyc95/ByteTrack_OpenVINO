xhost +local:root
docker run -it --rm --privileged --network=host \
    -v /dev/video*:/dev/video* \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --env="QT_X11_NO_MITSHM=1" \
    -e DISPLAY=$DISPLAY bytetrack-openvino /bin/bash
    

# docker run -it -v $PWD:/app/ --device=/dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY