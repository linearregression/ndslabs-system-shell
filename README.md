# NDS System Shell - A container with tooling to bootup a micro-cluster environment and run/admin use NDSLabs services.

This is the build source for the ndslabs/system-shell container image.
See https://github.com/nds-org

# Prerequisites
  * A linux amd64 architecture based Docker environment to run a development container based on this image.
  * Docker 1.9+
  * Docker Machine (https://docs.docker.com/machine/)
  * A provisioned CoreOS instance in NDSLabs (https://coreos.com/)

# Usage
  * Print usage information contained in the image "docker run --rm -it ndslabs/system-shell usage"
  * The usage command has arguments to emit a canonical docker run command for various environments
  * The system shell requires mapping the docker socket: docker run ... -v /var/run/docker/sock:/var/run/docker.sock
  * Check proper setup from within you developer container:  check-setup

# Commands
  * kube-up.sh - bring up a kubernetes micro-cluster
  * ndslabs-up.sh - layer NDSLabs services on-top of kubernetes
