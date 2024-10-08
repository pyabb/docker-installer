#!/usr/bin/bash

# Update your system
sudo dnf --refresh update

# Install the yum-utils package, which provides the yum-config-manager utility to set up repositories:
sudo dnf install yum-utils

# Add Docker repository using yum-config-manager:
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install docker and docker compose plugin
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verifying Docker installation
if docker --version > /dev/null 2>&1; then
    echo "Docker is installed successfully."
    slep 1
else
    echo "Docker installation failed or not found. Activating Docker manually."
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker has been started and enabled."
fi

# Verifying Docker Compose installation
if docker compose --version > /dev/null 2>&1; then
    echo "Docker Compose is installed successfully."
    slep 1
else
    echo "Docker Compose installation failed or not found. Please check the installation."
fi
