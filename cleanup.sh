#!/bin/sh -e

cd /etc/p5mon/
rm -f status.new

sleep 18

perl -ane 'print if $F[0]>time-370*24*3600' status > status.new

if [ "00`wc -c < status.new`" -ge 1 ] ;then
  mv status.new status
else
  echo "`date`: p5mon: Unable to cleanup" >&2
  exit 2
fi
