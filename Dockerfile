FROM sagnitude/ubuntu-essential


MAINTAINER sagnitude <sag@sagnitude.com>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /workspace
WORKDIR /workspace
COPY ./install_cnpm.sh /workspace/install_cnpm.sh
RUN chmod 755 /workspace/install_cnpm.sh; curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get update && apt-get install -y --yes --no-install-recommends nodejs
RUN /workspace/install_cnpm.sh

COPY ./start.sh /workspace/start.sh
RUN chmod 755 /workspace/start.sh