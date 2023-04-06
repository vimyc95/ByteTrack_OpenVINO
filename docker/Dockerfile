FROM openvino/ubuntu20_runtime

USER root
WORKDIR /workspace 
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git cmake make gcc g++ vim curl gnupg2 lsb-release wget unzip

RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install system and development components
RUN apt-get update && apt-get -y --no-install-recommends install \
    apt-utils \
    software-properties-common \
    build-essential \
    cmake \
    git \
    python3-pip \
    libxext6 \
    libx11-6 \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    freeglut3-dev \
    libgtk2.0-dev \
    pkg-config \
    && apt-get -y autoremove \
    && apt-get clean

# Install OpenCV 4.5.4
RUN git clone https://github.com/opencv/opencv.git
RUN cd opencv && git checkout 4.5.4 \
    && mkdir build \
	&& cd build \
	&& cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. \
	&& make -j8 \
	&& make install \ 
	&& rm -rf opencv 
# Install eigen 3.3.3
RUN git clone https://github.com/libigl/eigen.git
RUN cd eigen \
    && mkdir build \
	&& cd build \
    && cmake .. \
    && make -j8 \
	&& make install \ 
	&& rm -rf eigen

WORKDIR /workspace/ByteTrack_OpenVINO

ENV ws /workspace/ByteTrack_OpenVINO
COPY ${PWD}/src ${ws}/src
COPY ${PWD}/include ${ws}/include
COPY ${PWD}/CMakeLists.txt ${ws}/CMakeLists.txt

RUN echo "source /opt/intel/openvino/setupvars.sh" >> ~/.bashrc && source ~/.bashrc
ENV DISPLAY :0
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute
ENV TERM=xterm
# Some QT-Apps don't show controls without this
ENV QT_X11_NO_MITSHM 1

