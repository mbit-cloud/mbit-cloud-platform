
#!/bin/sh

# See http://docs.docker.io/en/latest/use/workingwithrepository/

# delete all non-running container
docker ps -a | grep 'Exit' |  awk '{print $1}' | xargs docker rm -f > /dev/null &

# delete unused images
docker images | grep '<none>' |  awk '{print $3}'  | xargs docker rmi -f > /dev/null &

# delete specific images
# docker rmi app/example
