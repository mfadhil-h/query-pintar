ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';

flush privileges;

INSERT INTO mysql.user (Host, User, Password) VALUES ('%', 'root', password("admin"));
GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;