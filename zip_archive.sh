#!/bin/bash

# Creates a zip archive with the currentdate as name
# Intended for use with crontab

BACKUPDATE=$(date +'%d%m%y')
TARGETDIR=/backup/archive
REGEX=*_backup.zip
MAXFILES=4

zip -r /backup/archive/"$BACKUPDATE"_backup.zip /backup/*_backup

# Deletes the oldest file in the targetdir directory if the number of files exceeds the maxfiles variable.

cd $TARGETDIR

if [ $(ls -1q $REGEX | wc -l) = $MAXFILES ] ; then
        ls -1q $REGEX | wc -l
        rm -- "$(ls -rt | head -n 1)"
fi