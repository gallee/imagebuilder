# this file is supposed to be sourced by the get-files shell script

odroid_u3_release_version="5.10.3-stb-exy%2B"
odroid_u3_uboot_version="200821-01"

rm -f ${DOWNLOAD_DIR}/kernel-odroid_u3-armv7l.tar.gz
wget -v https://github.com/hexdump0815/linux-mainline-and-mali-generic-stable-kernel/releases/download/${odroid_u3_release_version}/${odroid_u3_release_version}.tar.gz -O ${DOWNLOAD_DIR}/kernel-odroid_u3-armv7l.tar.gz

rm -f ${DOWNLOAD_DIR}/boot-odroid_u3-armv7l.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${odroid_u3_uboot_version}/exy-boot.dd.gz -O - | gunzip -c >> ${DOWNLOAD_DIR}/boot-odroid_u3-armv7l.dd
