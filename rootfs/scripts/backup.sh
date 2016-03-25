#!/bin/bash
__dirname="$(dirname "$0")"
"${__dirname}/backup-s3.sh"
"${__dirname}/backup-postgres.sh"
