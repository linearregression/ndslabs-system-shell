#!/bin/bash

cat /usr/local/lib/ndslabs/gui.yaml | mustache | kubectl create -f-
cat /usr/local/lib/ndslabs/apiserver.yaml | mustache | kubectl create -f-

echo "Creating ~/.ndslabsctl.yaml"
APISERVER=`kubectl describe svc ndslabs-apiserver | grep ^IP | awk '{print $2}'`
echo "server: http://$APISERVER:8083" > ~/.ndslabsctl.yaml
