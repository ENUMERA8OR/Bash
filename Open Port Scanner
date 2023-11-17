#!/bin/bash

echo "Enter IP address"
read ip

for port in {1..65535}; do
  timeout .1 bash -c "</dev/tcp/$ip/$port &>/dev/null" && echo "port $port is open"
done
