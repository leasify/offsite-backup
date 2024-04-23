#!/bin/bash
# file: backup.sh
# Leasify AB, Andreas Ek, 2024-04-22

now=$(date +"%Y-%m-%d")
sudo mkdir -p /backup/${now}
sudo mkdir -p /backup/${now}/leasify-trunk-1
sudo mkdir -p /backup/${now}/leasify-backups

yday=$(date --date "yesterday" "%Y-%m-%d")

sudo cp -Rf /backup/${yday}/leasify-trunk-1 /backup/${now}/leasify-trunk-1
sudo cp -Rf /backup/${yday}/leasify-backups /backup/${now}/leasify-backups

sudo aws s3 sync s3://leasify-trunk-1 /backup/${now}/leasify-trunk-1
sudo aws s3 sync s3://leasify-backups /backup/${now}/leasify-backup

sudo find /backup -type d -mtime +30 -exec sudo rm -rf {} \;
