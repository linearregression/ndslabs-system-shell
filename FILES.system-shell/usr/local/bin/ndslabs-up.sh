#!/bin/bash

cat /usr/local/lib/ndslabs/gui.yaml | mustache | kubectl create -f-
cat /usr/local/lib/ndslabs/apiserver.yaml | mustache | kubectl create -f-

kubectl label nodes 127.0.0.1 ndslabs-node-role="compute"
