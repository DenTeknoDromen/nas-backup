#!/bin/bash

# Creates variables from env.sh
source env.sh

# Adds empty newline to the end of sync_ignore if none is present
# To make sure --exclude-from flag reads all lines properly
if [ "$( tail -n 1 "$LOCAL_CONFIG" )" = "" ]; then echo "" >> "$LOCAL_CONFIG"; fi

# Push and pull to remote directory and prints output to logs
# Ignores any fiels specified in "sync_ignore"
{
    echo "Sync started at ${NOW} on ${DEVICE} to ${REMOTE_USER}@${REMOTE}"
    rsync --archive --compress --partial --verbose --exclude-from="$LOCAL_CONFIG" "${LOCAL_DIR}/" "${REMOTE_USER}@${REMOTE}:/backup/${REMOTE_DIR}"
    rsync --archive --compress --partial --verbose --exclude-from="$LOCAL_CONFIG" "${REMOTE_USER}@${REMOTE}:/backup/${REMOTE_DIR}/" "${LOCAL_DIR}"
    printf -- "-%.0s" {1..100}
    printf '\n'
} >> "$LOGFILE"