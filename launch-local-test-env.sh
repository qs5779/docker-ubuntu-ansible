#!/bin/bash

IMAGE=${1:-ubuntu:20.04}

docker run \
  --rm \
  --tty \
  --interactive \
  --volume $(git rev-parse --show-toplevel):/var/code/ \
  "$IMAGE"  /bin/bash
