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

echo "==> Checking Homebrew packages"
for package in "git" "ansible"
do
  packageAvailable=`command -v $package`
  if [ "${packageAvailable}" = "" ]; then
    echo "## $package not available"
    echo "++ Installing $package"
    brew install $package
  else
    echo "## $package already installed"
  fi
done

echo "## Installed Ansible versions"
ansible --version
ansible-community --version
