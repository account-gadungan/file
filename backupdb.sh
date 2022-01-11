#!/bin/bash

##Variables
NOW=`date +"%Y-%m-%d"`;
BACKUPPATH="/mnt/backupdb/"
BACKUPDIR="$BACKUPPATH/$NOW";
RETENTION="+30";

### Server Setup ###
#* MySQL login user name *#

MUSER="root";

#* MySQL login PASSWORD name *#
MPASS="P@ssw0rd^DB123";

#* MySQL login HOST name *#
MHOST="localhost";
MPORT="3306";

# DO NOT BACKUP these databases
IGNOREDB="
dbsf_nbc_mtindonesia_training
dbsf_nbc_mtindonesia_training_dmart
information_schema
mysql
test
performance_schema
"

#* MySQL binaries *#
MYSQL=`which mysql`;
MYSQLDUMP=`which mysqldump`;
GZIP=`which gzip`;

# assuming that /nas is mounted via /etc/fstab
if [ ! -d $BACKUPDIR ]; then
  mkdir -p $BACKUPDIR
else 
 :
fi
# get all database listing
DBS="$(mysql -u $MUSER -p$MPASS -h $MHOST -P $MPORT -Bse 'show databases')"

# SET DATE AND TIME FOR THE FILE
#NOW=`date +"d%dh%Hm%Ms%S"`; # day-hour-minute-sec format
# start to dump database one by one
for db in $DBS
do
        DUMP="yes";
        if [ "$IGNOREDB" != "" ]; then
                for i in $IGNOREDB # Store all value of $IGNOREDB ON i
                do
                        if [ "$db" == "$i" ]; then # If result of $DBS(db) is equal to $IGNOREDB(i) then
                                DUMP="NO";         # SET value of DUMP to "no"
                                #echo "$i database is being ignored!";
                        fi
                done
        fi

        if [ "$DUMP" == "yes" ]; then # If value of DUMP is "yes" then backup database
                FILE="$BACKUPDIR/$NOW-$db.gz";
                echo "BACKING UP $db";
                $MYSQLDUMP -CfQq --add-drop-database --hex-blob --order-by-primary --routines=true --triggers=true --no-data=false --opt --lock-all-tables -u $MUSER -p$MPASS -h $MHOST -P $MPORT $db | gzip > $FILE
        fi
done



# Delete files older than the retention variable
find $BACKUPPATH/* -mtime $RETENTION -exec rm -Rdf {} \;
