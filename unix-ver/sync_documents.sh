#!/bin/bash

REMOTE_DIR=test_dir
LOCAL_DIR=./test_dest
REMOTE_USER=pi
REMOTE="<IP>"
LOCAL_CONFIG=sync_ignore
LOGFILE=./log
DEVICE=$(hostname)
NOW=$(date)

if [ "$( tail -n 1 $LOCAL_CONFIG )"="" ];
then
    echo "" >> $LOCAL_CONFIG
fi

echo "Sync started at ${NOW} on ${DEVICE} to ${REMOTE_USER}@${REMOTE}" >> $LOGFILE
rsync --archive --compress --partial --verbose --exclude-from=$LOCAL_CONFIG "${LOCAL_DIR}/" "${REMOTE_USER}@${REMOTE}:/backup/${REMOTE_DIR}" >> $LOGFILE
rsync --archive --compress --partial --verbose --exclude-from=$LOCAL_CONFIG "${REMOTE_USER}@${REMOTE}:/backup/${REMOTE_DIR}/" "${LOCAL_DIR}" >> $LOGFILE
printf -- "-%.0s" {1..100} >> $LOGFILE
printf '\n' >> $LOGFILE
