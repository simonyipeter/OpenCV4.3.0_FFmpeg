FROM czentye/opencv-video-minimal:latest
RUN apk --no-cache add git make alpine-sdk automake autoconf nasm yasm bash
RUN mkdir /install && cd /install &&  git clone https://code.videolan.org/videolan/x264.git && git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
#RUN cd /install/yasm && ./autogen.sh && ./configure && make -j4&& make install
RUN cd /install/x264/ && /install/x264/configure --enable-static --enable-shared && make -j4 && make install
#RUN cd /install/x264/ && ldconfig
RUN cd /install/ffmpeg && ./configure --enable-gpl --enable-libx264 --enable-nonfree
RUN cd /install/ffmpeg && make -j4 && make install
