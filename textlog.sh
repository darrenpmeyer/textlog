#!/usr/bin/env bash
set -euo pipefail

### textlog.sh - command to open current log in 'today.md', updating
###   for current day if textlog-new.sh is findable

TEXTLOGDATESPEC=${TEXTLOGDATESPEC:-"%Y-%m-%d"}  # Default to YYYY-MM-DD per ISO 8601 extended
TEXTLOGPREFIX=${TEXTLOGPREFIX:-"textlog"}       # Prefix files with 'textlog-' by default
TEXTLOGDIR=${TEXTLOGDIR:-"$HOME/textlog"}       # Log to ~/textlog by default
TEXTLOGEDITOR=${TEXTLOGEDITOR:-"$EDITOR"}       # Use $EDITOR by default

datespec=$(date "+$TEXTLOGDATESPEC")            
logfile="$TEXTLOGDIR/$TEXTLOGPREFIX-$datespec.md"

# If the log dir doesn't exist, make it
if ! [ -d "$TEXTLOGDIR" ]
then
	>&2 echo "'$TEXTLOGDIR' doesn't exist, making it"
	mkdir -p "$TEXTLOGDIR"
fi

# If there's not a logfile for today, make it
if ! [ -f "$logfile" ]
then
	touch "${logfile}"
fi

# make sure we have a valid editor before continuing
if [ -z "$TEXTLOGEDITOR" ]
then
	>&2 echo "No log editor specified, and no EDTIOR environment; quitting"
	exit 254
fi

#edit today's file
"$TEXTLOGEDITOR" "$logfile"
