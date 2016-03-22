#!/bin/bash
PGHOST=$(docker-machine ip default)
export PGHOST
export PGUSER=postgres
export PGPASSWORD=

dumpfile="./data/latest/postgres/${DATABASE}.dump"

read -r -p "Are you sure you want to restore ${dumpfile} on
${PGHOST}/${DATABASE}? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
  pg_restore --verbose --clean --no-acl --no-owner -d "$DATABASE" "$dumpfile"
else
  exit 1
fi