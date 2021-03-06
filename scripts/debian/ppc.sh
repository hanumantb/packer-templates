#!/bin/bash

mkdir -p /etc/apt/sources.list.d
echo 'deb "http://packages.osuosl.org/repositories/apt/" jessie main' > /etc/apt/sources.list.d/osuosl.list

wget -qO - http://packages.osuosl.org/repositories/apt/repo.gpg | sudo apt-key add -

apt-get update
apt-get install -y ppc64-diag
