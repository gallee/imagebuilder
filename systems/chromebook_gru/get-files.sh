# this file is supposed to be sourced by the get-files shell script

chromebook_gru_release_version="5.10.50-stb-mt7%2B"

rm -f ${DOWNLOAD_DIR}/kernel-chromebook_gru-${2}.tar.gz
wget -v https://github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/releases/download/${chromebook_gru_release_version}/${chromebook_gru_release_version}.tar.gz -O ${DOWNLOAD_DIR}/kernel-chromebook_gru-${2}.tar.gz

( cd ${DOWNLOAD_DIR} ; tar xzf kernel-chromebook_gru-${2}.tar.gz boot ; mv boot/vmlinux.kpart-* boot-chromebook_gru-${2}.dd ; rm -rf boot )