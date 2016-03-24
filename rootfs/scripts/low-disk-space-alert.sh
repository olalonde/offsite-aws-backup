#!/bin/bash
CURRENT=$(df /data | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90

echo "Disk Space: ${CURRENT}% used"

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
	echo "Low Disk Space Alert: ${CURRENT}% used"
  # TODO: cant get mail to work in docker... need to setup MTA in
  # Dockerfile?
  #mail -s 'Disk Space Alert' someemail@example.com << EOF
#Backup server remaining free space is critically low. Used: $CURRENT%
#EOF
fi
