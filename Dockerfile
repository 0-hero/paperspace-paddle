FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update && apt-get install -y rsync htop git openssh-server
RUN apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential \
        cmake \
        git \
        curl \
        vim \
        tmux \
        wget \
        bzip2 \
        unzip \
        g++ \
        ca-certificates \
        ffmpeg \
        libx264-dev \
        imagemagick \
        libnss3-dev \
        software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install python3-pip -y
RUN apt install python3.7 -y
RUN ln -s /usr/bin/python3.7 /usr/bin/python
RUN python -m pip3 install --upgrade pip

RUN mkdir /notebooks
WORKDIR /notebooks

RUN pip3 install -I jinja2 >=3.1.1 
RUN pip3 install --upgrade nbdev nbconvert jupyter jupyterlab
RUN pip3 install --upgrade ipywidgets
RUN pip3 install --upgrade jupyter_contrib_nbextensions jupyterlab-git

COPY run.sh /run.sh
CMD ["/run.sh"]
