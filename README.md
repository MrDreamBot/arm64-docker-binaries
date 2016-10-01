# arm64-docker-binaries

For ODROID-C2 users using the Armbian Jessie server, docker.io (the docker engine) is not available in
the repository meaning that you cannot apt-get install docker.

I have made available the docker v1.12.1 binaries for you. The binaries have been tested on both ODROID-C2
armbian xenial and jessie servers.

The install.sh script requires root to run. You can simulate the installation and find out what commands
it executes by changing to the arm64-docker-binaries directory and issue the command:

sudo ./install.sh -s

Once you are satisfied with it, issue the command:

sudo ./install.sh

When it finished, reboot. When it comes up, issue command:

sudo docker info

To avoid having to use sudo with each docker command, add group docker to your login as follows:

sudo usermod -aG docker your_login

Enjoy!



