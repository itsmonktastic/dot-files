#!/bin/sh
#
# Deal with problematic driver for my edimax usb wifi dongle

set -e

echo "Checking if bad driver blacklisted"
if grep '^blacklist rtl8192cu' /etc/modprobe.d/blacklist.conf > /dev/null; then
  echo "Already blacklisted"
else
  echo "Not blacklisted - adding to /etc/modprobe.d/blacklist.conf"
  echo "blacklist rtl8192cu" >> /etc/modprobe.d/blacklist.conf
fi

echo "Checking loaded drivers"
if lsmod | grep rtl8192cu > /dev/null; then
  echo "Bad driver loaded, will unload"
  # this driver is broken but takes precedence
  modprobe -r rtl8192cu
  # unload the good one just in case
  # this driver is usually loaded too, reload it to be sure
  modprobe -r rtl8xxxu
fi

echo "Loading good driver"
modprobe rtl8xxxu
