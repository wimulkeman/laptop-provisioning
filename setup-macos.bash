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

echo "==> Brew - Fetching Brewfile"
curl -fsSL https://raw.githubusercontent.com/wimulkeman/laptop-provisioning/refs/heads/main/darwin/Brewfile.base > Brewfile.base
echo "==> Brew - Installing dependencies through Brew"
brew bundle install --file=./Brewfile.base
