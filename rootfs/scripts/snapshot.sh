#!/bin/bash
type=$1

if [ "$type" = "daily" ]; then
  prefix="/data/snapshots/daily/"
  retention=7
elif [ "$type" = "weekly" ]; then
  prefix="/data/snapshots/weekly/"
  retention=4
elif [ "$type" = "monthly" ]; then
  prefix="/data/snapshots/monthly/"
  retention=12
else
  echo "Unknown backup type. Try daily, weekly or monthly"
  exit 1
fi

archive_id=$(date '+%d-%B-%Y')
ts=$(date +"%s")

# make sure snapshots dir exists
mkdir -p "$prefix"

echo "Starting ${type} archive"
tar -zcvpf \
  "${prefix}${ts}-${archive_id}.tar.gz" \
  -C /data/latest \
  .
# 2> /dev/null

# delete old archives
files=$(ls -1 $prefix*.tar.gz | sort)
file_count=$(echo "$files" | wc -w)
num_files_to_delete=$((file_count-retention))
if [ "$num_files_to_delete" -gt "0" ]; then
  echo "$num_files_to_delete"
  echo "$files" | head -n$num_files_to_delete | xargs rm
fi

echo "Completeted ${type} archive"