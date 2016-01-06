FROM sagnitude/ubuntu-essential


MAINTAINER sagnitude <sag@sagnitude.com>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /workspace
WORKDIR /workspace
COPY ./install_cnpm.sh /workspace/install_cnpm.sh
RUN chmod 755 /workspace/install_cnpm.sh; apt-get install -y python-software-properties python g++ make;add-apt-repository ppa:chris-lea/node.js; apt-get update && apt-get install -y --yes --no-install-recommends nodejs
RUN /workspace/install_cnpm.sh

COPY ./start.sh /workspace/start.sh
RUN chmod 755 /workspace/start.sh