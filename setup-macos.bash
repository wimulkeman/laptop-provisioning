#!/bin/bash

echo "========================================"
echo "          Laptop Provisioning           "
echo "========================================"

echo "> Checking availability Brew"
if command -v brew 2>&1 >/dev/null
then
  echo "## Brew available"
else
  echo "## Brew not available"
  echo "++ Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "> Checking Homebrew packages"
if command -v git 2>&1 >/dev/null
then
  echo "## Git available"
else
  echo "## Git not available"
  echo "++ Installing Git"
  brew install git
fi

echo "> Checking Homebrew packages"
if command -v git 2>&1 >/dev/null
then
  echo "## Ansible available"
else
  echo "## Ansible not available"
  echo "++ Installing Ansible"
  brew install ansible
fi
