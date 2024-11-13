#!/bin/bash

echo "========================================"
echo "========= Laptop Provisioning =========="
echo "========================================"

echo '==> Enabling FileVault'
sudo fdesetup enable

echo "==> Brew - Checking availability Brew"
brewAvailable=`command -v brew`
if [ "${brewAvailable}" = "" ]; then
  echo "## Brew not available"
  echo "++ Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "## Brew already installed"
fi

echo "==> Brew - Fetching Brewfile for basic dependencies"
curl -fsSL https://raw.githubusercontent.com/wimulkeman/laptop-provisioning/refs/heads/main/darwin/Brewfile.base > Brewfile.base
echo "==> Brew - Installing basic dependencies through Brew"
brew bundle install --file=./Brewfile.base

echo "==> Brew - Removing Brewfile for basic dependencies"
rm Brewfile.base

echo '==> Provisioning setup - Creating directory for provisioning scripts'
mkdir -p ~/laptop-provisioning

echo '==> Provisioning setup - Fetching provisioning scripts'
git clone https://github.com/wimulkeman/laptop-provisioning.git ~/laptop-provisioning
