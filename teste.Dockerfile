FROM nvidia/cuda:11.1-devel-ubuntu20.04 as base

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 