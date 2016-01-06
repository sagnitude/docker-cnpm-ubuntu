FROM sagnitude/ubuntu-essential


MAINTAINER sagnitude <sag@sagnitude.com>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /workspace
WORKDIR /workspace

# RUN cd /workspace; wget --no-check-certificate https://nodejs.org/dist/v4.2.4/node-v4.2.4.tar.gz; tar -zxvf node-v4.2.4.tar.gz; cd node-v4.2.4; ./configure; make -j4; make install

RUN cd /workspace; wget http://sagmm.b0.upaiyun.com/test/node-v4.2.4.out.tar.gz; tar xvf node-v4.2.4.out.tar.gz; cd node-v4.2.4; make install

RUN npm install -g --registry=http://registry.npm.taobao.org cnpmjs.org cnpm sqlite3
RUN cnpm set registry http://localhost:7001

COPY ./start.sh /workspace/start.sh
RUN chmod 755 /workspace/start.sh