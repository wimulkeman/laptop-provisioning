#!/bin/bash

echo "========================================"
echo "          Laptop Provisioning           "
echo "========================================"

echo "==> Checking availability Brew"

brewAvailable=`command -v brew`
if [ "${brewAvailable}" = "" ]; then
  echo "## Brew not available"
  echo "++ Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "## Brew already installed"
fi

echo "==> Fetching Brewfile"
curl -fsSL https://raw.githubusercontent.com/wimulkeman/laptop-provisioning/refs/heads/main/darwin/Brewfile > Brewfile
echo "==> Installing dependencies through Brew"
brew bundle install --file=./Brewfile

echo '==> Enabling FileVault'
sudo fdesetup enable
