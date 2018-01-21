# Spring FB 

## DB
```
DROP DATABASE IF EXISTS springfoofb_db;
CREATE DATABASE springfoofb_db CHARACTER SET utf8 COLLATE utf8_bin;

use springfoofb;

CREATE USER 'foousername'@'localhost' IDENTIFIED BY 'foopasswd';
GRANT ALL PRIVILEGES ON springfoofb_db.* TO 'foousername'@'localhost' IDENTIFIED BY 'foopasswd' WITH GRANT OPTION; 

CREATE TABLE EMPLOYEE(
    id INT NOT NULL auto_increment, 
    name VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    salary DOUBLE NOT NULL,
    ssn VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
```
