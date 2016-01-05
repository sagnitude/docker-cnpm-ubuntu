FROM ubuntu:14.04


MAINTAINER sagnitude <sag@sagnitude.com>

RUN mkdir /workspace
COPY ./setup_4.x /workspace/setup_4.x
COPY ./install_cnpm.sh /workspace/install_cnpm.sh
RUN chmod 755 /workspace/setup_4.x /workspace/install_cnpm.sh; /workspace/setup_4.x
RUN apt-get install --yes --no-install-recommends python build-essential libtool nodejs

WORKDIR /workspace
RUN /workspace/install_cnpm.sh

# Clean up.
RUN apt-get autoremove --yes \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/*