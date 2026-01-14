#!/bin/bash

FILE=./backup_sources
DEVICE=$(hostname)
REMOTE_USER=pi
REMOTE=raspberrypi

while read LINE || [ -n "$LINE" ];
do
    folder=$(echo "${LINE}" | awk -F '/' '{print $NF}')
    echo "${folder}"
    # rsync --archive --compress --partial -n "${SOURCE}/" "${USER}:${REMOTE}/backup/${DEVICE}_backup/${folder}" >> ./log
    # rsync --archive --compress --partial "${SOURCE}/" "./${DEVICE}_backup/${folder}"
done < "${FILE}"
