# OpenPose container

Pull this image from [Docker](https://hub.docker.com/r/amorimcleison/openpose).

This container aims to provide a simple way to use the [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) library.

It is based in a [Nvidia CUDA](https://hub.docker.com/r/nvidia/cuda/) development image with the following OS and libraries:
- Ubuntu 18.04 (Bionic Beaver)
- CUDNN 8
- NVIDIA CUDA 11.1
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
