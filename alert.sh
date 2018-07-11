#!/bin/sh -e

PROBES=4

die(){
	echo "`date`: p5mon: $@" >&2
	./send_alert.sh "`date`: p5mon: $@"
	exit 2
}

cd /etc/p5mon/

set `tail -$PROBES status |cut -d' ' -f2`

FIRST=$1
shift

[ $# -ge 1 ] || die Unable to check alerts

OLDIFS="$IFS"
IFS=""
LAST="$*"
IFS="$OLDIFS"

[ "00$FIRST" -gt "00$LAST" ] && die Fucked up

[ "00$FIRST" -eq 0 ] && [ "00$LAST" -eq 1 ] && die Fixed
