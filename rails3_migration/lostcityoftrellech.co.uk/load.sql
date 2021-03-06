-- SELECT id, login, crypted_password, salt, created_at, updated_at FROM users INTO OUTFILE '/tmp/tutorials.txt' FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
-- SELECT id, login, crypted_password, salt, created_at, updated_at FROM users INTO OUTFILE '/tmp/tutorials.txt' FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';

-- normal imports

LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/albums.out' INTO TABLE albums FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/applications.out' INTO TABLE applications FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/blogs.out' INTO TABLE blogs FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/comments.out' INTO TABLE comments FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/enquiries.out' INTO TABLE enquiries FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/folders.out' INTO TABLE folders FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/galleries.out' INTO TABLE galleries FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/jobs.out' INTO TABLE jobs FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/menus.out' INTO TABLE menus FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/menu_items.out' INTO TABLE menu_items FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/pages.out' INTO TABLE pages FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/page_templates.out' INTO TABLE page_templates FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/pictures.out' INTO TABLE pictures FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/posts.out' INTO TABLE posts FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
 -- LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/sites.out' INTO TABLE sites (id, name, url, contact_address, start_page_id, default_template_id, global_title, created_at, updated_at) FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/rwilson/Rails/root_cms/rails3_migration/unloads/sites.out' INTO TABLE sites FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r'; 

insert into users (username, email, password_hash, password_salt, created_at, updated_at) values ("rswilson","rswilsonuk@gmail.com","$2a$10$ZJymgx7QjLnD/ppP5ysqqeLOUXXJxyHf4BMrZifYqakheyelXxWAm","$2a$10$ZJymgx7QjLnD/ppP5ysqqe", "2011-02-16 18:33:05", "2011-02-16 18:33:05");

-- insert into users (username, email) values ("rswilson", "rswilsonuk@gmail.com");
-- update users set password_ha
