FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3.10 python3-pip git cmake ninja-build wget && \
    apt-get install -y g++

# RUN apt-get install -y nvidia-utils-470

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

WORKDIR /opt/dg
RUN git clone https://github.com/dreamgaussian/dreamgaussian.git

WORKDIR /opt/dg/dreamgaussian
COPY ./requirements_docker_test.txt /opt/dg/dreamgaussian
COPY ./torch_version.py /opt/dg/dreamgaussian
COPY ./gradio_app.py /opt/dg/dreamgaussian
RUN pip install -r requirements_docker_test.txt

RUN git clone --recursive https://github.com/ashawkey/diff-gaussian-rasterization