#!/bin/bash

# Variables
bitlength=$(getconf LONG_BIT)
[[ $(type -p dpkg) != '' ]]
dpkg=$?

# Perform prestart checks
function prestart {
  # Check for root
  if [[ $EUID -ne 0 ]]; then
    echo "We need root privileges to execute this script." 1>&2
    exit 1
  fi
  # Check for 64 bit & dpkg
  if [[ $dpkg != 0 ]] || [[ $bitlength != 64 ]]; then
    echo "This script currently only supports 64 bit debian based systems." 1>&2
    exit 1
  fi
}

fetch_archive () {
  echo 'Fetching archive...'
  wget -t0 -O ~/vscode-linux.deb https://go.microsoft.com/fwlink/?LinkID=760868
}

do_install () {
  echo 'Installing...'
  dpkg -i ~/vscode-linux.deb
  apt-get install -f
}

cleanup () {
  echo 'Cleaning up...'
  rm ~/vscode-linux.deb
}

prestart;
fetch_archive;
do_install;
cleanup;

echo 'Done!' && exit 0
