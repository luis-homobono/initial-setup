#!/bin/bash

OS=$(uname)
SYSTEMS=("Linux" "Darwin")
if [[ " ${SYSTEMS[*]} " =~ " ${OS} " ]]; then

  if [[ $OS == "Darwin" ]]; then
    echo "System $OS is compatible with this scripts."
    export OS="macos"
  elif [[ $OS == "Linux" ]]; then

    if [[ -f /etc/os-release ]]; then
      . /etc/os-release
      OS_NAME=$ID
      OS_FAMILY=$ID_LIKE
    else
      echo "Error: Unable to determine OS. /etc/os-release file not found."
      echo "Installation stopped."
      exit 1
    fi

    if [[ "$OS_NAME" == "debian" || "$OS_NAME" == "ubuntu" || "$OS_FAMILY" == *"debian"* ]]; then
      echo "System based on Debian detected..."
      export OS="debian"
    elif [[ "$OS_NAME" == "arch" || "$OS_FAMILY" == *"arch"* ]]; then
      echo "System based on Arch Linux detectado..."
      export OS="arch"
    elif [[ "$OS_NAME" == "fedora" || "$OS_FAMILY" == *"fedora"* ]]; then
      echo "System based on Fedora detected..."
      export OS="fedora"
    else
      echo "Distribution doesn't soported by this script...: $OS_NAME"
      exit 1
    fi

  fi
fi
