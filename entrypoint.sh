#!/bin/sh
originalfile=/etc/gammurc
tmpfile="/etc/gammurc.tmp"
cp $originalfile $tmpfile
cat $originalfile | envsubst > $tmpfile && mv $tmpfile $originalfile
gammu-smsd -c /etc/gammurc -p /var/run/gammu-smsd.pid