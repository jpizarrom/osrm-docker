FROM jpizarrom/docker-chef-client

MAINTAINER Juan Pizarro "jpizarrom@gmail.com"

RUN apt-get -y update

ADD . /chef

RUN cd /chef && /opt/chef/embedded/bin/berks vendor /chef/cookbooks

RUN chef-solo -c /chef/solo.rb -j /chef/solo-osrm-build.json
