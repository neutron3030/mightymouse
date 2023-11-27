#!/bin/bash

set -e

apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    apcalc \
    artha \
    atril \
    bash-completion \
    bsdgames \
    btop \
    build-essential \
    cgdb \
    clamav \
    clang-format \
    cmake \
    cmake-curses-gui \
    curl \
    docker-compose \
    docker.io \
    dos2unix \
    ffmpeg \
    file \
    gdb \
    gimp \
    git \
    git-flow \
    gnuradio \
    greed \
    hping3 \
    htop \
    info \
    iperf3 \
    iproute2 \
    iputils-arping \
    iputils-clockdiff \
    iputils-ping \
    iputils-tracepath \
    less \
    libcurl4-gnutls-dev \
    libevent-dev \
    libfftw3-dev \
    libgcrypt20-dev \
    libgnutls28-dev \
    libhiredis-dev \
    libmicrohttpd-dev \
    libpcap-dev \
    libreoffice \
    libwebsockets-dev \
    libzmq3-dev \
    lshw \
    lsof \
    make \
    mc \
    micro \
    nano \
    net-tools \
    nmap \
    nvtop \
    openssh-client \
    openssh-server \
    parallel \
    patch \
    pciutils \
    procps \
    psmisc \
    redis \
    screen \
    sshfs \
    strace \
    taskwarrior \
    tcpdump \
    telnet \
    terminator \
    termshark \
    tmux \
    traceroute \
    tree \
    tshark \
    tzdata \
    uftrace \
    unzip \
    vim \
    wget \
    wireshark \
    wireshark-gtk \
    xxd \
    xxhash \
    xz-utils \
    zeal
apt-get autoremove -y --purge
apt-get clean
rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

