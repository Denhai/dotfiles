#!/usr/bin/env bash

# exit when any command fails
set -e
set -x

DAY=$(date +%A)
BACKUP_PATH=/media/hayden/nvme2
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if [ -e $BACKUP_PATH/$DAY ] ; then
  rm -rf $BACKUP_PATH/$DAY
fi

# -n --dry-run --info=progress2
rsync -a --stats --human-readable --delete -delete-excluded \
    --backup --backup-dir=/media/hayden/nvme2/$DAY \
    --exclude-from=$parent_path/exclude.txt \
    /home/hayden/ \
    $BACKUP_PATH/full
