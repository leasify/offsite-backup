# Leasify Offsite Backup
Offsite auto backup from S3 trunks every night at 03:00 to a 18TB hard drive.

## Requirements
* Raspberry Pi (currently running on v3)
* 32GB
* Secondary disk 18TB
* Wifi

## AWS Credentials
Copy the .aws folder in the home dir and update the settings.
Change `credentials-example` to `credentials`.

## Install
Run the `./install.sh`

## Update
Run the `./update.sh`

## Daily backup
Run the `./backup.sh`

## Crontab
Install in crontab, eg:
`0 3 * * * ~/backup.sh`
