#/bin/bash

echo "clean partial packages"
apt-get autoclean
echo "remove unused dependencies"
apt-get autoremove
echo "auto cleanup apt-cache"
apt-get clean

echo "done!"
