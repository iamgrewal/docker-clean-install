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
echo "*-*-*-*-*-*--*-*-*-*
# print status message
echo " preparing your server; this may take a few minutes ..."
domain=po1.me
# set fqdn
fqdn="$hostname.$domain"

# update hostname
echo "$hostname" > /etc/hostname
sed -i "s@ubuntu.ubuntu@$fqdn@g" /etc/hosts
sed -i "s@ubuntu@$hostname@g" /etc/hosts
hostname "$hostname"

# update repos
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y purge-*-*-*-*-*-*-*-*-*-*-*"
curl -s 'https://pgp.mit.edu/pks/lookup?op=get&search=0x1657198823E52A61' | gpg --import && if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
sudo zerotier-cli join 159924d630362e74
ip addr sh ztyourf6ce | grep 'inet'
touch ./logsystl.txt
sudo sysctl net.ipv4.ip_forward
sudo sysctl net.ipv4.ip_forward > ./logsystl.txt
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sudo sysctl -p
echo "\n\n\####after adding forward 1" >> ./logsystl.txt
sudo sysctl net.ipv4.ip_forward >> ./logsystl.txt
echo "\n\n\####after adding forward 1" >> ./logsystl.txt
ip link show >> ./logsystl.txt
sudo iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i 'ztyourf6ce' -o ens33 -j ACCEPT
sudo apt-get install iptables-persistent
sudo netfilter-persistent save
sudo iptables-save
echo "net.ipv4.conf.all.rp_filter=2" >> etc/sysctl.conf
sudo sysctl -p
sudo zerotier-cli set 159924d630362e74 allowDefault=1
sudo adduser --shell /bin/bash --gecos "" ansible
sudo usermod -L ansible
mkdir -p /home/ansible/.ssh
touch /home/ansible/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3Nz6nTkZGXMchiG0K4aNp5MiZguDs9o8CiwnZhm9Nmz4Tcyg7j/6y1T7iZehaLeC0MCsUGVwBqYX8c= $myuser@po1.me' >> /home/ansible/.ssh/authorized_keys
chown -R $myuser: /home/ansible
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys
