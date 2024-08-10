FROM ubuntu:20.04

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
  gcc \
  python3 \
  python3-dev \
  python3-pip \
  libssl-dev \
  jq && \
  rm -rf /var/lib/apt/lists/*

ENV pip_packages "\
  python-openstackclient==6.6.0 \
  otcextensions==0.31.7 "

RUN pip3 install $pip_packages && \
    useradd -m openstack
USER openstack
WORKDIR /home/openstack
RUN mkdir -p ~/.config/openstack
ENTRYPOINT ["openstack"]