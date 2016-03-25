#!/bin/sh
set -x

mkdir -p /data/latest

# write env variables cron will use for its scripts
env > /etc/default/cron

rsyslogd
cron
touch /var/log/cron.log
tail -F /var/log/syslog /var/log/cron.log
