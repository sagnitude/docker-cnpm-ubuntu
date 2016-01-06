#!/bin/sh

cd /workspace

apt-get install python mysql-server -y --yes

wget http://sagmm.b0.upaiyun.com/test/node-v4.2.4.out.tar.gz
tar xvf node-v4.2.4.out.tar.gz

cd node-v4.2.4
make -j4
make install

cd ..

rm -rf node-v4.2.4
rm node-v4.2.4.out.tar.gz

npm install -g cnpmjs.org cnpm sqlite3

cnpm set registry http://localhost:7001

mysql -uroot -e 'DROP DATABASE IF EXISTS cnpmjs_test;' &&\
mysql -uroot -e 'CREATE DATABASE cnpmjs_test;' &&\
mysql -uroot 'cnpmjs_test' < node_modules/cnpmjs.org/docs/db.sql &&\
mysql -uroot 'cnpmjs_test' -e 'show tables;'
