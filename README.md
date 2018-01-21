# Spring FB 

## DB
```
DROP DATABASE IF EXISTS springfoofb;
CREATE DATABASE springfoofb CHARACTER SET utf8 COLLATE utf8_bin;

use springfoofb;

CREATE USER 'foouser'@'localhost' IDENTIFIED BY 'foopassword';
GRANT ALL PRIVILEGES ON * . * TO 'foouser'@'localhost';

CREATE TABLE EMPLOYEE(
    id INT NOT NULL auto_increment, 
    name VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    salary DOUBLE NOT NULL,
    ssn VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
```
