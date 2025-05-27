CREATE USER 'nestuser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'nestpass';
GRANT ALL PRIVILEGES ON clinica_dental.* TO 'nestuser'@'localhost';
FLUSH PRIVILEGES;