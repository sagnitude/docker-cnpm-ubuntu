FROM sagnitude/ubuntu-essential


MAINTAINER sagnitude <sag@sagnitude.com>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /workspace
WORKDIR /workspace

# RUN cd /workspace; wget --no-check-certificate https://nodejs.org/dist/v4.2.4/node-v4.2.4.tar.gz; tar -zxvf node-v4.2.4.tar.gz; cd node-v4.2.4; ./configure; make -j4; make install

RUN apt-get install python -y

RUN cd /root; wget http://sagmm.b0.upaiyun.com/test/node-v4.2.4.out.tar.gz; tar xvf node-v4.2.4.out.tar.gz; cd node-v4.2.4; make -j4; make install

RUN cd /workspace; rm -rf /root/node-v4.2.4; rm /root/node-v4.2.4.out.tar.gz; npm install -g cnpmjs.org cnpm sqlite3
RUN cnpm set registry http://localhost:7001

RUN apt-get install mysql-server php5-mysql -y --yes

COPY ./start.sh /workspace/start.sh
RUN chmod 755 /workspace/start.sh