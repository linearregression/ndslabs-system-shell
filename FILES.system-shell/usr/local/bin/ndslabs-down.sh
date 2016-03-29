#!/bin/bash

kubectl delete service ndslabs-gui ndslabs-apiserver
kubectl delete --cascade=true rc ndslabs-gui ndslabs-apiserver
