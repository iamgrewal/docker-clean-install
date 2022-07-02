# docker-clean-install
Install clean version of docker on ubuntu

Step 1 : Clean your existing Docker install

wget -O - https://raw.githubusercontent.com/iamgrewal/docker-clean-install/main/docker-remove.sh | bash -s


IMP:You could use xargs which would do nothing if no images of the type specified were found instead of showing an error.

docker ps -qa --no-trunc --filter "status=exited" | xargs docker rm

// how-to-remove-old-and-unused-docker-images

docker ps
docker ps -a
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

docker images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

docker images | grep "none"
docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
