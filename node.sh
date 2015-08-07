#!/bin/bash
# This script installs OpenJDK and gets a VM ready so DataStax OpsCenter can perform an install on it.

echo "Installing Azul Zulu JDK"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
apt-add-repository -y "deb http://repos.azulsystems.com/ubuntu stable main"
apt-get -y update
apt-get -y install zulu-8

echo "Partitioning and formatting all attached data disks"
bash vm-disk-utils-0.1.sh

echo "Modifying permissions"
chmod -R 777 /datadisks
