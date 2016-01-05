FROM sagnitude/ubuntu-essential


MAINTAINER sagnitude <sag@sagnitude.com>

RUN mkdir /workspace
WORKDIR /workspace
COPY ./install_cnpm.sh /workspace/install_cnpm.sh
RUN chmod 755 /workspace/install_cnpm.sh;
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -E
RUN apt-get install --yes --no-install-recommends nodejs
RUN /workspace/install_cnpm.sh

COPY ./start.sh /workspace/start.sh;
RUN chmod 755 /workspace/start.sh