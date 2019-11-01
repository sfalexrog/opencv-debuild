#!/bin/bash

echo "-= Registering qemu binfmts"

docker run --rm --privileged sfalexrog/qemu-register:v4.1.0

echo "-= Running raspbian-based container for build"

docker run -it --rm -v $(pwd):/build sfalexrog/raspbian:buster /bin/bash -c 'cd /build; ./build.sh'

