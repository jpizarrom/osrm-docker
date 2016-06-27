FROM jpizarrom/docker-chef-client

MAINTAINER Juan Pizarro "jpizarrom@gmail.com"

RUN apt-get -yqq update

RUN apt-get -yqq install build-essential git cmake pkg-config libprotoc-dev libprotobuf8 \
protobuf-compiler libprotobuf-dev libosmpbf-dev libpng12-dev \
libbz2-dev libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev \
libzip-dev libboost-all-dev lua5.1 liblua5.1-0-dev libluabind-dev libluajit-5.1-dev libtbb-dev

ENV OSRM_VERSION 5.2.6

ADD . /chef

RUN cd /chef && /opt/chef/embedded/bin/berks vendor /chef/cookbooks

RUN chef-solo -c /chef/solo.rb -j /chef/solo-osrm-build.json
