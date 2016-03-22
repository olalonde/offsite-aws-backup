#!/bin/bash

# TODO: spin up read replica before doing backup
# TODO: use pg_dumpall to dump all databases?

mkdir -p /data/latest/postgres
echo "Starting pg_dump"
pg_dump -Fc --no-acl --no-owner "$DATABASE" > "/data/latest/postgres/${DATABASE}.dump"
echo "Completed pg_dump"