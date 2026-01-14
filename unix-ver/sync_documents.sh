#!/bin/bash

source env.sh

if [ "$( tail -n 1 "$LOCAL_CONFIG" )" = "" ];
then
    echo "" >> "$LOCAL_CONFIG"
fi

{
    echo "Sync started at ${NOW} on ${DEVICE} to ${REMOTE_USER}@${REMOTE}"
    rsync --archive --compress --partial --verbose --exclude-from="$LOCAL_CONFIG" "${LOCAL_DIR}/" "${REMOTE_USER}@${REMOTE}:/backup/${REMOTE_DIR}"
    rsync --archive --compress --partial --verbose --exclude-from="$LOCAL_CONFIG" "${REMOTE_USER}@${REMOTE}:/backup/${REMOTE_DIR}/" "${LOCAL_DIR}"
    printf -- "-%.0s" {1..100}
    printf '\n'
} >> "$LOGFILE"