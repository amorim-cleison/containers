FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

# Install common packages:
RUN echo "Installing common packages..." && \
	apt-get -y --no-install-recommends update && \
	apt-get -y --no-install-recommends upgrade && \
	apt-get install -y --no-install-recommends \
		apt-utils \
		apt-transport-https \
		ca-certificates \
		gnupg \
		software-properties-common \
		wget

# Upgrade to Python 3.8:
RUN echo "Upgrading to Python 3.8..." && \
	apt-get -y --no-install-recommends update && \
	add-apt-repository ppa:deadsnakes/ppa && \
	apt-get -y --no-install-recommends update && \
	apt-get install -y --no-install-recommends \
		python3.8 \
		python3.8-dev \
		python3.8-venv \
		python3-setuptools \
		python3-pip && \
	update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
	rm /usr/bin/python3 && \
	ln -sf python3.8 /usr/bin/python3 && \
	rm /usr/bin/python && \
	ln -sf python3.8 /usr/bin/python && \
	update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
	rm /usr/bin/pip && \
	ln -sf /usr/bin/pip3 /usr/bin/pip && \
	apt-get install --reinstall -y --no-install-recommends \
		python3 \
		python3-dev \
		python3-wheel \
		python3-minimal \
		python3-apt \
		python-apt-common \
		libpython3-stdlib \
		python3-dbus \
		python3-gi \
		python3-software-properties \
		software-properties-common && \
	python -m pip install --upgrade pip

# Install tzdata so that apt won't fail on it:
RUN echo "Setting up timezone..." && \
	export DEBIAN_FRONTEND=noninteractive; \
	ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
	apt-get update -y && \
	apt-get install -y --no-install-recommends tzdata
	
# Upgrade CMake version:
RUN echo "Upgrading CMake..." && \
	wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
	   apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
	   apt-get update && \
	apt-get -y --no-install-recommends update && \
	apt-get install -y --no-install-recommends \
		cmake \
		cmake-gui

# Install OpenPose dependencies:
RUN echo "Installing dependencies..." && \
	apt-get -y --no-install-recommends update && \
	apt-get -y --no-install-recommends upgrade && \
	apt-get install -y --no-install-recommends \
		build-essential \
		git \
		libatlas-base-dev \
		libprotobuf-dev \
		libleveldb-dev \
		libsnappy-dev \
		libhdf5-serial-dev \
		protobuf-compiler \
		libboost-all-dev \
		libgflags-dev \
		libgoogle-glog-dev \
		liblmdb-dev \
		pciutils \
		opencl-headers \
		ocl-icd-opencl-dev \
		libviennacl-dev \
		libcanberra-gtk-module \
		libopencv-dev && \
		python -m pip install \
			numpy \
			scikit-build \
			protobuf \
			opencv-python \
			poetry

# Install OpenPose:
RUN echo "Downloading and building OpenPose..." && \
	git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git && \
	mkdir -p /openpose/build && \
	cd /openpose/build && \
	sed -i 's/set(AMPERE "80 86")/set(AMPERE "")/g' /openpose/cmake/Cuda.cmake && \
	cmake .. && \
	sed -i 's/set(AMPERE "80 86")/set(AMPERE "")/g' /openpose/3rdparty/caffe/cmake/Cuda.cmake && \
	make -j`nproc` && \
	wget -P /openpose/models/pose/coco/ https://github.com/foss-for-synopsys-dwc-arc-processors/synopsys-caffe-models/raw/master/caffe_models/openpose/caffe_model/pose_iter_440000.caffemodel && \
	ln -sf /openpose/build/examples/openpose/openpose.bin /usr/bin/openpose

# Install additional packages:
RUN echo "Installing additional packages..." && \
	apt-get -y --no-install-recommends update && \
	apt-get -y --no-install-recommends upgrade && \
	apt-get install -y --no-install-recommends \
		ffmpeg

WORKDIR /home