#!/bin/bash
# file: backup.sh
# Leasify AB, Andreas Ek, 2024-04-22

now=$(date +"%Y-%m-%d")
mkdir -p /backup/${now}
mkdir -p /backup/${now}/leasify-trunk-1
mkdir -p /backup/${now}/leasify-backups

aws s3 sync s3://leasify-trunk-1 /backup/${now}/leasify-trunk-1
aws s3 sync s3://leasify-backups /backup/${now}/leasify-backup

find /backup -type d -mtime +30 -exec rm -rf {} \;
