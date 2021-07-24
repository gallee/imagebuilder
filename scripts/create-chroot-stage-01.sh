#!/bin/bash

# do not ask anything
export DEBIAN_FRONTEND=noninteractive

export LANG=C

apt-get update
apt-get -yq upgrade
# slick greeter is required as the default one seems to have problems on 32bit systems
# see: https://bluesabre.org/2019/10/20/install-xubuntu-19-10-on-a-raspberry-pi-4/
# TODO: libllvm10 is here for the self built mesa, maybe it can go soon or already ...
if [ "$1" = "focal" ]; then 
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data xubuntu-desktop linux-firmware lvm2 cryptsetup-bin slick-greeter rsyslog btrfs-progs btrfs-compsize dialog libllvm10 cgpt liblz4-tool vboot-kernel-utils plymouth plymouth-label plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text xserver-xorg-video-fbdev
  # in the chromebook native case there is an own special cros kernel
  if [ "$2" = "x86_64" ] && [ "${CROSPARTS}" != "true" ]; then
    apt-get -yq install linux-image-generic
  fi
elif [ "$1" = "bullseye" ]; then 
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data task-xfce-desktop xserver-xorg-input-synaptics blueman firmware-linux-free firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-brcm80211 firmware-iwlwifi firmware-intel-sound firmware-samsung firmware-libertas firmware-realtek firmware-qcom-soc firmware-qcom-media firmware-atheros pulseaudio pavucontrol lvm2 cryptsetup-bin cryptsetup slick-greeter btrfs-progs btrfs-compsize dialog cgpt liblz4-tool vboot-kernel-utils bc plymouth plymouth-themes xserver-xorg-video-fbdev
  tasksel install standard
  if [ "$2" = "i686" ]; then
    apt-get -yq install linux-image-686
  # in the chromebook native case there is an own special cros kernel
  elif [ "$2" = "x86_64" ] && [ "${CROSPARTS}" != "true" ]; then
    apt-get -yq install linux-image-amd64
  fi
# special focal config used as base for building sonaremin images
elif [ "$1" = "sonaremin" ]; then
  apt-get -yq install vim openssh-server qjackctl fluxbox xpra xvfb libgl1 rtirq-init sudo net-tools ifupdown iputils-ping isc-dhcp-client lxterminal kmod less rsync overlayroot u-boot-tools xinit xserver-xorg-input-libinput mingetty locales irqbalance usbutils mousepad alsa-utils matchbox-keyboard dosfstools a2jmidid samba avahi-daemon liblo7 libfftw3-3 unzip libcap2-bin xserver-xorg-legacy libllvm10 linux-firmware
  if [ "$2" = "x86_64" ]; then
    apt-get -yq install linux-image-generic
  fi
fi
