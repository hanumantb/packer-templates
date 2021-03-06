#!/bin/bash

echo "Disabling automatic udev rules for network interfaces in Ubuntu"
# Disable automatic udev rules for network interfaces in Ubuntu,
# appends cmdline options to the linux kernel
sed -i 's/append\=\"/append\=\"net\.ifnames\=0\ /' /etc/yaboot.conf\
  || echo "Yaboot not found!"
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT\=\"/GRUB_CMDLINE_LINUX_DEFAULT\=\"net\.ifnames\=0 /' /etc/default/grub\
  && grub-mkconfig -o /boot/grub/grub.cfg\
  || echo "Grub2 not found!"

# Fix ethernet address for network interfaces
sed -i 's/auto\ en.*/auto\ eth0/' /etc/network/interfaces
sed -i 's/iface\ en.*/iface\ eth0\ inet\ dhcp/' /etc/network/interfaces

# Adding a 5 sec delay to the interface up, to make the dhclient happy
echo "pre-up sleep 5" >> /etc/network/interfaces;
