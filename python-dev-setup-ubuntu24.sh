#!/bin/bash

# Script to set up a Python development environment on Ubuntu 24.04
# Optimized for VMware Workstation

# Update and upgrade the system
echo "Updating system..."
sudo apt update && sudo apt -y upgrade

# Install common dependencies and tools
echo "Installing common dependencies..."
sudo apt install -y build-essential curl git wget zsh unzip

# VMware Tools installation and optimization
echo "Installing VMware Tools..."
sudo apt install -y open-vm-tools open-vm-tools-desktop

# Enable shared folders and other optimizations
echo "Optimizing Ubuntu for VMware..."
sudo systemctl enable open-vm-tools
sudo systemctl start open-vm-tools

# Install Python and required packages
echo "Installing Python..."
sudo apt install -y python3 python3-pip python3-venv

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Install VS Code Python extension
echo "Installing VS Code Python extension..."
code --install-extension ms-python.python

# Install other useful extensions
echo "Installing other useful extensions..."
code --install-extension ms-vscode.cpptools
code --install-extension ms-azuretools.vscode-docker
code --install-extension esbenp.prettier-vscode

# Final system cleanup
echo "Cleaning up..."
sudo apt autoremove -y

echo "Setup complete! Python development environment is ready."
