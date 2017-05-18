#!/bin/bash

if [ `whoami` != 'root' ]; then
	echo You have to be root to run this script.
	exit 1
fi

if [ $# -gt 0 ]; then

	if [ $1 != "-s" ]; then
		echo Invalid command line option: $1
		echo Usage: $0 [-s]
		exit 2
	fi
	echo Entering simulation mode...
	ECHO=echo
else
	echo Starting installation...
fi


echo Copying docker binaries...
$ECHO cp ./bin/docker /usr/bin/
$ECHO cp ./bin/docker-containerd /usr/bin/
$ECHO cp ./bin/docker-containerd-ctr /usr/bin/
$ECHO cp ./bin/docker-containerd-shim /usr/bin/
$ECHO cp ./bin/dockerd /usr/bin/
$ECHO cp ./bin/docker-proxy /usr/bin/
$ECHO cp ./bin/docker-runc /usr/bin/

echo Checking existence of docker group
if [ ! `grep docker /etc/group` ]; then
        echo Adding docker group and adding root to the docker group...
	$ECHO groupadd docker
	$ECHO usermod -aG docker root

	echo Setting up systemd
	$ECHO cp docker.service /lib/systemd/system/
	$ECHO ln -s /lib/systemd/system/docker.service /etc/systemd/system/multi-user.target.wants/docker.service
	$ECHO cp docker /etc/init.d/
else
	echo docker group already exists, skipping set up of systemd docker.service
fi

echo "When you are ready, reboot the system."

echo "docker.service can be controlled using the command:"

echo "sudo systemctl start|stop docker.service"
