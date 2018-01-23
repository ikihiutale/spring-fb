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

## Tomcat

### tomcat-users.xml ([tomcat -> conf)

```
<tomcat-users>
  <role rolename="manager-gui"/>  
  <role rolename="manager-script"/>   
  <user username="admin" password="password" roles="manager-gui,manager-script" />  
</tomcat-users>
```

### Maven settings.xml (maven > conf)

```
<servers>  
    <server>
       <id>TomcatServer</id>
       <username>admin</username>
       <password>password</password>
    </server>
</servers>    
```

### Tomcat plugin pom.xml

```
<plugin>
  <groupId>org.apache.tomcat.maven</groupId>
  <artifactId>tomcat8-maven-plugin</artifactId>
  <version>3.0-r1756463</version>
  <configuration>
    <port>8080</port>
    <path>/</path>
    <username>admin</username>  
    <password>password</password>    
  </configuration>
</plugin>
```
