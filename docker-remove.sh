
#!/bin/bash
### J Grewal####
timestamp=$(date +%Y%m%d_%H%M%S)
log_path="`pwd`"
filename=docker_cleanup_$timestamp.log
log=$log_path/$filename


docker_space_before(){
CURRENTSPACE=`docker system df`
echo "Current Docker Space:" >> $log
echo $CURRENTSPACE >>$log
}
docker_find (){
echo "#####################################################################" >> $log
echo "Finding images" >> $log
echo "#####################################################################" >> $log
REMOVEIMAGES=`docker images | grep " [days|months|weeks]* ago" | awk '{print $3}'`

echo "Listing images that needs to be cleaned up" >> $log
echo $REMOVEIMAGES >>$log

}




docker_cleanup(){
echo "#####################################################################" >> $log
echo "Cleaning images" >> $log
echo "#####################################################################" >> $log
docker rmi ${REMOVEIMAGES}
}

docker_space_after(){
CURRENTSPACE=`docker system df`
echo "Current Docker Space, after clean up:" >> $log
echo $CURRENTSPACE >>$log
}
docker ps -aq
# Stop all running containers
docker stop $(docker ps -aq)
# Remove all containers
docker rm $(docker ps -aq)
# Remove all images
docker rmi $(docker images -q)
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rm $(docker ps -a -q)
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  
sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
dpkg -l | grep -i docker


docker_space_before
docker_find
docker_cleanup
docker_space_after
sudo apt-get update; sudo apt purge docker docker.io containerd.io; 
sudo apt autoremove; sudo apt auto purge ;sudo apt install -f
sudo apt autoclean && sudo apt autoremove
