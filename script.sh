#!/bin/bash
#chmod +x ./script.sh
#script.sh
# APT
echo "=====APT====="
sudo apt update
sudo apt upgrade
# Fonts
echo "=====Fonts====="
sudo apt-get install figlet
figlet -f /usr/share/figlet/starwars.flf
# Create and navigate to t3rn directory
mkdir t3rn
cd t3rn
# Download latest release
curl -s https://api.github.com/repos/t3rn/executor-release/releases/latest | \
grep -Po '"tag_name": "\K.*?(?=")' | \
xargs -I {} wget https://github.com/t3rn/executor-release/releases/download/{}/executor-linux-{}.tar.gz
# Extract the archive
tar -xzf executor-linux-*.tar.gz
# Navigate to the executor binary location
cd executor/executor/bin

# Install screen
sudo apt-get install screen
screen -S t3rn-executor

# Set preferred Node Environment
export NODE_ENV=testnet
# Set your log settings:
export LOG_LEVEL=debug
export LOG_PRETTY=false
# Process orders and claims
export EXECUTOR_PROCESS_ORDERS=true
export EXECUTOR_PROCESS_CLAIMS=true
# Networks
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l1rn'
echo "Insert PRIVATE_KEY_LOCAL manually"

#export PRIVATE_KEY_LOCAL=
#./executor