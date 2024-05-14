#!/bin/bash
# file: backup.sh
# Leasify AB, Andreas Ek, 2024-05-14

#yday=$(date --date "yesterday" +"%Y-%m-%d")
#echo "${yday}"
mount /dev/sda2 /mnt/backup

latest=$(ls -td /mnt/backup/*/ | head -1)

echo "Latest backup: ${latest}"
[[ -z "${latest}" ]] && { echo "No latest backup folder found..." ; exit 1; }

now=$(date +"%Y-%m-%d")
sudo mkdir -p /mnt/backup/${now}
sudo mkdir -p /mnt/backup/${now}/leasify-trunk-1
sudo mkdir -p /mnt/backup/${now}/leasify-backups

if ! [ "${latest}" = "" ]; then
    sudo cp -Rf ${latest}leasify-trunk-1 /mnt/backup/${now}/leasify-trunk-1
    sudo cp -Rf ${latest}leasify-backups /mnt/backup/${now}/leasify-backups
fi

sudo aws s3 sync s3://leasify-trunk-1 /mnt/backup/${now}/leasify-trunk-1
sudo aws s3 sync s3://leasify-backups /mnt/backup/${now}/leasify-backup

sudo find /mnt/backup -type d -mtime +30 -exec sudo rm -rf {} \;
