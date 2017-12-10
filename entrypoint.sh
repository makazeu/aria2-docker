#!/bin/bash
sed -i "s/rpc-secret=placeholder/rpc-secret=${rpc}/g" /aria2/aria2.conf
sed -i "s/username/${username}/g" /aria2/caddy.conf
sed -i "s/password/${password}/g" /aria2/caddy.conf

cd /aria2
nohup aria2c --conf-path=/aria2/aria2.conf > /aria2/aria2.log 2>&1 &

./caddy -conf=/aria2/caddy.conf