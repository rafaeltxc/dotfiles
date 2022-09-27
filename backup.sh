!/bin/bash

find /backup/* -mmin +354 -exec rm -rf {} \; # Set timer to delete old files

TIME=`date +%I-%d-%b`                  	   # This Command will read the date.
FILENAME=projects-$TIME.tar.gz             # The filename including the date.
SRCDIR=/home/rtxct/Desktop/projects/       # Source backup folder.
DESDIR=/backup                             # Destination of backup file.
tar -cpzf $DESDIR/$FILENAME $SRCDIR        # Execute backcup


