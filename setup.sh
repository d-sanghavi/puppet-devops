#!/bin/bash
set -e

echo "Adding OpenVox repository..."

wget -q https://apt.voxpupuli.org/openvox8-release-ubuntu22.04.deb

sudo dpkg -i openvox8-release-ubuntu22.04.deb

sudo apt-get update -y

echo "Installing Puppet Server (the agent is installed as a dependency)..."

sudo apt-get install -y openvox-server

echo "Configuring Puppet..."

sudo sed -i 's/-Xms2g -Xmx2g/-Xms1g -Xmx1g/' /etc/default/puppetserver

echo "127.0.0.1 puppet" | sudo tee -a /etc/hosts

P=/opt/puppetlabs/bin/puppet

sudo $P config set server puppet --section main

sudo $P config set certname puppet --section main

sudo $P config set certname codespace-agent --section agent

sudo $P config set runinterval 2m --section agent

sudo mkdir -p /var/run/puppetlabs/puppetserver

sudo chown -R puppet:puppet /var/run/puppetlabs/puppetserver

echo "Setup complete. Start the server with:"

echo "sudo /opt/puppetlabs/bin/puppetserver foreground"
