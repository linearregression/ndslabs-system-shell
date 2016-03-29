#!/bin/bash

kubectl delete pods,services,rc --all
docker kill $(docker ps | grep kubelet | cut -d' ' -f1)
docker kill $(docker ps | grep k8s_ | cut -d' ' -f1)
