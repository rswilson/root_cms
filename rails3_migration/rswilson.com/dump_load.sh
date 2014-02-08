#!/bin/sh
echo "Dropping old db"
rake db:drop
echo "Creating db"
rake db:create
echo "Migrating db"
rake db:migrate
echo "Downloading latest db dump"
scp root@rswilson.com:~/users/rswilson/database_backups/rswilson.com_dump.sql .
echo "Loading data"
/usr/local/mysql/bin/mysql -u root -D lostcityoftrellech.co.uk_development -p < rswilson.com_dump.sql
