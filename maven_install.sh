#!/bin/bash

# Check if Maven is already installed
if which mvn >/dev/null; then
  echo "Maven is already installed. Exiting..."
  exit 0
fi

# Download Maven 3.8.7
wget https://downloads.apache.org/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.tar.gz -P /tmp

# Extract the archive
tar -xvzf /tmp/apache-maven-3.8.7-bin.tar.gz -C /opt

# Create a symbolic link to make it easier to upgrade to future versions of Maven
ln -s /opt/apache-maven-3.8.7 /opt/maven

# Set up environment variables
echo 'export M2_HOME=/opt/maven' >> ~/.bashrc
echo 'export PATH=$PATH:$M2_HOME/bin' >> ~/.bashrc

# Refresh the environment variables
source ~/.bashrc

# Verify the installation
mvn -version

echo "Maven 3.8.7 has been installed successfully!"
