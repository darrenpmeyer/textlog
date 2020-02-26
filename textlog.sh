#!/usr/bin/env bash
set -euo pipefail

### textlog.sh - command to open current log in 'today.md', updating
###   for current day if textlog-new.sh is findable

# BSD 3-Clause License

# Copyright (c) 2020, Darren P Meyer
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.

# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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
