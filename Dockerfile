FROM ubuntu:23.04
MAINTAINER Phillip Richmond <phillip.a.richmond@gmail.com>

LABEL \
  description="image to run ARC-SV https://github.com/SUwonglab/arcsv"

# Get libraries and compilers  
RUN apt-get update && apt-get install -y \
  autoconf \
  bzip2 \
  gcc \
  g++ \
  git \
  libbz2-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  liblzma-dev \
  make \
  ncurses-dev \
  ruby \
  wget \
  libxml2-dev \
  zlib1g-dev 

# Get software properties
RUN apt-get install -y software-properties-common

# Get deadsnakes
RUN add-apt-repository ppa:deadsnakes/ppa

# Get upgrade
RUN apt-get upgrade -y

# Get python
RUN apt-get install -y python3.11
RUN apt-get install -y python3-pip


#########
# Build #
#########

###############
# Upgrade PIP #
###############

RUN pip3 install --upgrade pip 
RUN pip3 install -U pip setuptools

#########################
# Clone and Pip install #
#########################

RUN mkdir -p /opt

WORKDIR /opt
RUN git clone https://github.com/phillip-a-richmond/arcsv.git && \
  cd arcsv && \
  pip3 install --user .

RUN export PATH="/opt/arcsv/:~/.local/bin/:$PATH"
RUN ln -s /usr/bin/python3.11 /usr/bin/python
RUN ln -s /opt/arcsv/bin/arcsv /usr/bin/arcsv
