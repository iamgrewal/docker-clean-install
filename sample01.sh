#!/bin/bash

### J Grewal####
timestamp=$(date +%Y%m%d_%H%M%S)
log_path="`pwd`"
filename=docker_install_$timestamp.log
log=$log_path/$filename
set -e
sudo apt-get update &&
sudo apt-get install -y openjdk-18-jdk -y &&
sudo apt install -y openjdk-18-jre -y &&
sudo apt update
sudo apt install -y libc6-x32 libc6-i386 &&
wget -c https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.deb &&
sudo apt install ./jdk-18_linux-x64_bin.deb -y
cat <<EOF /etc/profile.d/jdk18.sh
export JAVA_HOME=/usr/lib/jvm/jdk-18
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
source /etc/profile.d/jdk18.sh
sudo apt update &&
sudo apt install nodejs &&
sudo apt install nodejs
echo "JDK and JRE Installed"
echo "*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
