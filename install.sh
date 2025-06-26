#!/bin/bash

# Update packages
echo "Updating packages..."
sudo apt-get update -y

# Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER && newgrp docker
 
# Refresh group membership (optional, requires logout/login or new shell for effect)
echo "You may need to log out and log back in to apply the Docker group changes to your user."

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

# Install Minikube
echo "Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mkdir -p /usr/local/bin/
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Verify installations
echo "Verifying installations..."
docker --version
kubectl version --client
minikube version

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=docker

echo "Installation completed. Docker, kubectl, and Minikube are now installed, and Minikube is running."
