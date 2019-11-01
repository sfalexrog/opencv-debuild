#!/usr/bin/env bash

# This should be run as root (in a Docker container)


echo "--- Installing base packages"
apt update
apt install -y build-essential devscripts fakeroot ninja-build

echo "--- Getting opencv sources"
git clone https://github.com/opencv/opencv -b 3.4.8 --depth 1 deb_opencv_clever
cd deb_opencv_clever
git clone https://github.com/opencv/opencv_contrib -b 3.4.8 --depth 1 contrib
cd ..

echo "--- Copying Debian build rules"
cp -r debian deb_opencv_clever/

echo "--- Installing dependencies"
cd deb_opencv_clever
yes | mk-build-deps -i

echo "--- Building packages"
export DEB_BUILD_OPTIONS="parallel=$(nproc)"
fakeroot debian/rules binary

