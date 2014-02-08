#!/bin/sh
echo "Dropping old db"
rake db:drop
echo "Creating db"
rake db:create
echo "Migrating db"
rake db:migrate
echo "Getting unloaded data from topgradjobs.co.uk"
scp -r root@rswilson.com:/root/users/rswilson/rails3_migration/topgradjobs.co.uk/unloads/*.out unloads/.
echo "Loading data"
/usr/local/mysql/bin/mysql -u root -D lostcityoftrellech.co.uk_development -p < load_mac_os_x.sql
