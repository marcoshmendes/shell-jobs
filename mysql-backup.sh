#!/usr/bin/env bash

DATE=$(date +%d-%m-%Y-%T)
BACKUP_DIR="########################"
S3_BUCKET_NAME=##########
DAYS_TO_KEEP=7
MYSQL_USER=############
MYSQL_PASSWORD=####################
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump
DATABASE=#########################

# purge old backups
find $BACKUP_DIR -mindepth 1 -mtime +$DAYS_TO_KEEP -type f -delete

# DUMP
$MYSQLDUMP --force --opt --single-transaction --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $DATABASE > "$BACKUP_DIR/$DATE.sql"

# Push backups to S3
s3cmd sync -r --delete-removed $BACKUP_DIR/ s3://$S3_BUCKET_NAME
