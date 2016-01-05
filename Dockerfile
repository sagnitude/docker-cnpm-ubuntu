FROM sagnitude/ubuntu-essential


MAINTAINER sagnitude <sag@sagnitude.com>

RUN mkdir /workspace
COPY ./setup_4.x /workspace/setup_4.x
COPY ./install_cnpm.sh /workspace/install_cnpm.sh
RUN chmod 755 /workspace/setup_4.x /workspace/install_cnpm.sh; /workspace/setup_4.x
RUN apt-get install --yes --no-install-recommends nodejs

WORKDIR /workspace
RUN /workspace/install_cnpm.sh

COPY ./start.sh /workspace/start.sh;
RUN chmod 755 /workspace/start.sh