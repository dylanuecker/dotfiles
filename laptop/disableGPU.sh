#!/bin/sh
# from https://wiki.archlinux.org/title/Dell_XPS_15_(9570)

# check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi
printf "Unloading NVIDIA modules...\n"
modprobe -r nvidia_drm
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia
printf "Changing power control...\n"
# change NVIDIA card power control
echo -n auto > /sys/bus/pci/devices/0000\:01\:00.0/power/control
sleep 1
# change PCIe power control
echo -n auto > /sys/bus/pci/devices/0000\:00\:01.0/power/control
sleep 1
# lock system from loading nvidia module
if [ -f /etc/modprobe.d/disable-nvidia.conf.disable ]; then
	mv /etc/modprobe.d/disable-nvidia.conf.disable /etc/modprobe.d/disable-nvidia.conf
	printf "\nNVIDIA CARD IS NOW DISABLED.\n"
else
	printf "\nFile /etc/modprobe.d/disable-nvidia.conf.disable does not exist.\n"
	printf "Is the GPU already disabled ?\n"
fi
