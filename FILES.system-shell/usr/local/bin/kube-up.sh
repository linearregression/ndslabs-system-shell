#!/bin/sh
docker inspect k8-manifest-override > /dev/null 2>&1 || docker create --name k8-manifest-override -v /etc/kubernetes/manifests -it gcr.io/google_containers/hyperkube-amd64:v1.2.0 bash && docker cp /usr/local/lib/kubernetes k8-manifest-override:/etc

docker run \
    --volume=/:/rootfs:ro \
    --volume=/sys:/sys:ro \
    --volume=/var/lib/docker/:/var/lib/docker:rw \
    --volume=/var/lib/kubelet/:/var/lib/kubelet:rw \
    --volume=/var/run:/var/run:rw \
    --volumes-from=k8-manifest-override \
    --net=host \
    --pid=host \
    --privileged=true \
    -d \
    gcr.io/google_containers/hyperkube-amd64:v1.2.0 \
    /hyperkube kubelet \
        --containerized \
        --hostname-override="127.0.0.1" \
        --address="0.0.0.0" \
        --api-servers=http://localhost:8080 \
        --config=/etc/kubernetes/manifests \
        --allow-privileged=true --v=2
