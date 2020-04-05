#!/bin/bash

HOST='dedibackup-dc2.online.net'
USER=''
PASS=''
TARGETFOLDER='/'
SOURCEFOLDER='/mnt/path_to_rpn/'

lftp -f "
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --verbose $SOURCEFOLDER $TARGETFOLDER --exclude-glob *.tmp --exclude-glob *.tar.dat
bye
"
