#!/bin/bash

USER=""
PASSWORD=""
OUTPUT="/var/backups/mysql"

rm "$OUTPUTDIR/*gz" > /dev/null 2>&1

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $db > $OUTPUT/`date + %H`.$db.sql
        gzip -f $OUTPUT/`date +%H`.$db.sql
    fi
done
