#!/bin/bash
# file: backup.sh
# Leasify AB, Andreas Ek, 2024-04-22

now=$(date +"%Y-%m-%d")
mkdir -p ${now}
mkdir -p ${now}/leasify-trunk-1
mkdir -p ${now}/leasify-backups

aws s3 sync s3://leasify-trunk-1 ${now}/leasify-trunk-1
aws s3 sync s3://leasify-backups ${now}/leasify-backup

find . -type d -mtime +30 -exec rm -rf {} \;
