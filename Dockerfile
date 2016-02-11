FROM ubuntu:14.04
MAINTAINER Alban Linard <alban@linard.fr>

RUN apt-get update
RUN apt-get --yes install sudo git

RUN adduser --disabled-password --gecos "" cosy
RUN adduser cosy sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER cosy

ADD . /home/cosy/environment

RUN cd /home/cosy/environment && ./bin/install --in-ci --prefix=/usr/local/cosy
RUN rm -rf /home/cosy/environment
