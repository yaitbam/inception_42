-- # Create new user and Make The user GRANT ALL PRIVILEGES to all databases in loaclhosts
CREATE USER yaitbam@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO yaitbam@'localhost' IDENTIFIED BY 'root';

CREATE USER yaitbam@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO yaitbam@'%' IDENTIFIED BY 'root';

ALTER USER yaitbam@'localhost' IDENTIFIED BY 'root';
-- FLUSH PRIVILEGES;
