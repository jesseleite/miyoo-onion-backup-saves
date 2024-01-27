#!/bin/sh
echo $0 $*
LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Backup Saves" -m "Your saves are being backed up..." --auto &
cd $(dirname "$0")
cd /mnt/SDCARD

# Set initial backups subdir number
local n
if find Backups -mindepth 1 -maxdepth 1 | read; then
  n=$(ls Backups | sort -n | tail -n 1)
  n=$((n+1))
else
  n=0
fi

# Ensure backups dir exists
mkdir -p Backups/$n

# Backup saves dir
cp -r Saves Backups/$n/Saves
