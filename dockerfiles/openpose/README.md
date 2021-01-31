# OpenPose container

![Build](https://img.shields.io/docker/cloud/build/amorimcleison/openpose.svg)
![Pulls](https://img.shields.io/docker/pulls/amorimcleison/openpose)
![Image size](https://img.shields.io/docker/image-size/amorimcleison/openpose)
![Version](https://img.shields.io/docker/v/amorimcleison/openpose)

Pull this image from Docker as [amorimcleison/openpose](https://hub.docker.com/r/amorimcleison/openpose).

This container aims to provide a simple way to use the [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) library.

It is based in a [Nvidia CUDA](https://hub.docker.com/r/nvidia/cuda/) development image with the following OS and libraries:
- Ubuntu 18.04 (Bionic Beaver)
- NVIDIA CUDA 10.0
- CUDNN 7
- Python 3.8
- CMake (latest)

Additional Python libraries:
- PIP (latest)
- Numpy (latest)
- OpenCV (latest)
- Poetry (latest)

While running the image, OpenPose is available as a command. Just run:
```
> openpose
```

You may also locate OpenPose installation in the following path:
```
/openpose/
```
