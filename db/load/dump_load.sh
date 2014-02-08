#!/bin/sh
echo "Dropping old db"
rake db:drop
echo "Creating db"
rake db:create
echo "Migrating db"
rake db:migrate
echo "Downloading latest db dump"
#scp -P 30000 root@rswilson.com:~/users/rswilson/dumps/lostcityoftrellech.co.uk_dump.sql .
echo "Loading data"
mysql -u root -D lostcityoftrellech.co.uk_development -p < lostcityoftrellech.co.uk_dump.sql
echo "Reprocessing images"
bundle exec rails runner "Picture.find_each { |thing| thing.image.reprocess! }"
echo "Resaving albums"
bundle exec rails runner "Album.find_each { |thing| thing.save! }"
