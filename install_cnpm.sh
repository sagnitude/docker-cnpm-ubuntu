#!/bin/bash

npm install -g --build-from-source \
  --registry=http://registry.npm.taobao.org \
  --disturl=http://npm.taobao.org/mirrors/node \
  cnpmjs.org cnpm sqlite3
nohup cnpmjs.org start --admins='sagnitude,ids,admin,shared' \
  --scopes='@sagnitude,@ids,@admin,@shared' &
cnpm set registry http://localhost:7001