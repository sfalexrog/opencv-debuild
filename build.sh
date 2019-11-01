#!/usr/bin/env bash

# This should be run as root (in a Docker container)


echo "--- Installing base packages"
apt update
apt install -y build-essential devscripts fakeroot

echo "--- Installing dependencies"
cd deb_opencv_clever
yes | mk-build-deps -i

echo "--- Building packages"
fakeroot debian/rules binary

