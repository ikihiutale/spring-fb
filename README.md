# Spring FB 

Tools and technologies

* Spring MVC 4.3.12.RELEASE
* Spring Security 4.2.4.RELEASE
* Java JDK 1.8.0_162
* Maven 3.3.9
* Eclipse Oxygen.2
* Apache Tomcat 8.5.24


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

create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);
   
/* USER_PROFILE table contains all possible roles */ 
create table USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
     
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);
  
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
  
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
  
```

## Tomcat

### startup.bat Windows

set JPDA_ADDRESS=8014
set JPDA_TRANSPORT=dt_socket

call "%EXECUTABLE%" jpda start %CMD_LINE_ARGS%
rem call "%EXECUTABLE%" start %CMD_LINE_ARGS%

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
    <artifactId>tomcat7-maven-plugin</artifactId>
    <version>2.2</version>
    <configuration>
      <port>8080</port>
      <url>http://localhost:8080/manager/text</url>  
      <server>TomcatServer</server>
      <username>admin</username>  
      <password>password</password>      
      <contextReloadable>true</contextReloadable>
    </configuration>
  </plugin>
```

### (tomcat)/bin/startup.bat:
Add JPDA values:
```
set JPDA_ADDRESS=8014
set JPDA_TRANSPORT=dt_socket
```

### Deploy

> Start tomcat by clicking the (tomcat)/bin/startup.bat file 
> mvn clean install tomcat7:redeploy (or tomcat7:deploy)

### Debug

> Create new Remote Java Application item. Host: localhost, Port: 8014

