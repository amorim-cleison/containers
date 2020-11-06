FROM nvidia/cuda:11.1-devel-ubuntu20.04 as base

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3 python3-dev python3-pip git g++ wget make libprotobuf-dev protobuf-compiler libopencv-dev \
        libgoogle-glog-dev libboost-all-dev libcaffe-cuda-dev libhdf5-dev libatlas-base-dev

RUN pip3 install numpy opencv-python 