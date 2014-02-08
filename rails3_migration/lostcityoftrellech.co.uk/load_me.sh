#!/bin/sh
echo "Dropping old db"
rake db:drop
echo "Creating db"
rake db:create
echo "Migrating db"
rake db:migrate
echo "Getting unloaded data from lostcityoftrellech.co.uk"
#scp -r root@rswilson.com:/root/users/rswilson/rails3_migration/lostcityoftrellech.co.uk/unloads/*.out unloads/.
echo "Loading data"
mysql -u root -D lostcityoftrellech.co.uk_development -p < load_mac_os_x.sql
