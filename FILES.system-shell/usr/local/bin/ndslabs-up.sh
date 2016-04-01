#!/bin/bash

cat /usr/local/lib/ndslabs/gui.yaml | mustache | kubectl create -f-
cat /usr/local/lib/ndslabs/apiserver.yaml | mustache | kubectl create -f-

