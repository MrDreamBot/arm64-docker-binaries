# arm64-docker-binaries

For Update to New Release
-------------------------
For those who are using the previous v1.12.1 version, update to v1.13.1 is simple.
donwload this release. Change ownership of all binaries to root:root

and run the following commands:

sudo systemctl stop docker
sudo cp pathToNewBinaries/* /usr/bin/
sudo systemctl start docker
docker info

and you will see 1.13.1 is running.

For First Time Install
----------------------

For ODROID-C2 users using the Armbian Jessie server, docker.io (the docker engine) is not available in
the repository meaning that you cannot apt-get install docker.

I have made available the docker v1.12.1 binaries for you. The binaries have been tested on both ODROID-C2
armbian xenial and jessie servers.

The install.sh script requires root to run. You can simulate the installation and find out what commands
it executes by changing to the arm64-docker-binaries directory and issue the command:

>sudo ./install.sh -s

Once you are satisfied with it, issue the command:

>sudo ./install.sh

When it finished, reboot. When it comes up, issue command:

>sudo docker info

Note that this script assumes that you do not have docker installed on your system. However, it can also
be used for upgrading your system from a previous version of docker to 1.12.1. In that case, you must
stop docker before executing the install.sh script by issuing the command:

>sudo systemctl stop docker.service

To avoid having to use sudo with each docker command, add group docker to your login as follows:

>sudo usermod -aG docker your_login

Enjoy!



