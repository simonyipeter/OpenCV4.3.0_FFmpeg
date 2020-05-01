# OpenCV 4.3.0 FFmpeg 4.2.2
OpenCV container with FFmpeg based on Ubuntu:

# Install:
```
docker build -t opencv_ffmpeg:latest https://raw.githubusercontent.com/simonyipeter/OpenCV4.3.0_FFmpeg/master/Dockerfile
```
# Run:
```
docker run -itd -v $PWD/:/home/host_dir/ --name opencv_ffmpeg opencv_ffmpeg
```
# Exec:
```
echo $'import cv2\nprint(cv2.__version__)' > opencv_version.py
docker exec -it opencv_ffmpeg python3 /home/host_dir/opencv_version.py
```


