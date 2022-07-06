#!/bin/bash

echo '                  **********                  '
echo '                  **********                  '
echo '*** JUPYTER_IDE: BEGINNING STARTUP PROCESSES ***'
echo '                  **********                  '
echo '                  **********                  '


echo '---- STOPPING SERVICES ----'

# spin down services
docker-compose -f docker-compose-vanilla-jupyter.yml down 

echo '---- STOPPING NETWORK ----'

# spin down network
docker network rm ide_network


echo '---- SPINNING UP NEW NETWORK ----'

# spin up new version of network
docker network create --attachable --driver=bridge --subnet=10.2.0.0/24 ide_network
sleep 5

echo '---- GENERATING SERVICE IPs FOR COMPOSE FILES ----'
rm .env
touch .env

# cat jupyter ide to env
JUPYTER_IP=10.2.0.2
echo JUPYTER_IP=${JUPYTER_IP} >> .env

# cat machine and container mount points
MACHINE_MOUNT_POINT="./"
echo MACHINE_MOUNT_POINT=${MACHINE_MOUNT_POINT} >> .env

CONTAINER_MOUNT_POINT="/usr/src/app"
echo CONTAINER_MOUNT_POINT=${CONTAINER_MOUNT_POINT} >> .env

echo '---- STARTING SERVICES ----'
docker-compose -f docker-compose-vanilla-jupyter.yml up -d