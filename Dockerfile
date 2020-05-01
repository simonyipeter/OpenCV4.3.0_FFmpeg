FROM ubuntu:20.04
RUN export DEBIAN_FRONTEND=noninteractive&& ln -fs /usr/share/zoneinfo/Europe/Budapest /etc/localtime &&apt-get update && apt-get install yasm nasm cmake gcc g++ python3-dev python3-numpy libavcodec-dev libavformat-dev libswscale-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev libgtk-3-dev libgtk-3-dev git libfdk-aac-dev libx265-dev libnuma-dev libx264-dev -y && dpkg-reconfigure --frontend noninteractive tzdata
RUN mkdir /install && cd /install && git clone https://github.com/opencv/opencv.git && mkdir /install/opencv/build && cd /install/opencv/build && cmake ../ && make -j4 && make install
RUN cd /install && git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
RUN cd /install/ffmpeg && /install/ffmpeg/configure --enable-gpl --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-nonfree
RUN cd /install/ffmpeg && make -j4 && make install
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && pip install scikit-image requests

