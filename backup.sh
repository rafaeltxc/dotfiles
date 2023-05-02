!/bin/bash

find /BackupDirectory/* -mmin +354 -exec rm -rf {} \;   # Set timer to delete old files

TIME=`date +%I-%d-%b`                  	              # This Command will read the date.
FILENAME=projects-$TIME.tar.gz                          # The filename including the date.
SRCDIR=/DirectoryToBackup       			        # Source backup folder.
DESDIR=/SendBackup                                      # Destination of backup file.
tar -cpzf $DESDIR/$FILENAME $SRCDIR                     # Execute backcup
