#!/bin/sh
set -x
mkdir -p /data/latest
rsyslogd
cron
touch /var/log/cron.log
tail -F /var/log/syslog /var/log/cron.log
