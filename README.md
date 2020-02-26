# textlog

Scripts to help with keeping 'daily log' style notes in text files

simply run ``textlog.sh``; see the CONFIGURING section for controlling run

By default:

1. creates a directory `$HOME/textlog` if it doesn't exist
2. creates a file named `textlog-<date>.md` there if it doesn't exist, with `<date>` being an ISO-6801 extended version of today's date
4. opens your editor (as defined by `$EDTIOR`) to edit the above file


## CONFIGURING

The script is configured with environment variables as follows:

- `TEXTLOGDATESPEC` controls the logfile name's date format. Defaults to YYYY-MM-DD per ISO 8601 extended
- `TEXTLOGPREFIX` controls the word in front of the file's name. Prefix files with 'textlog' by default
- `TEXTLOGDIR` path (directory) for storing log files. Logs to `$HOME/textlog` by default
- `TEXTLOGEDITOR` path to editor to use for editing log files. Uses `$EDITOR` by default
