#!/bin/sh

echo $(which npm)
$(which npm) install -g --registry=http://registry.npm.taobao.org --disturl=http://npm.taobao.org/mirrors/node  cnpmjs.org cnpm sqlite3
$(which cnpm) set registry http://localhost:7001