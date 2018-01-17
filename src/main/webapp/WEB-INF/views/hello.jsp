<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring 4 MVC -HelloWorld</title>
  <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCss" />
  <link href="${bootstrapCss}" rel="stylesheet" />
  </head>
  <body>
    <h2>Hello World</h2>
    <h2>${message} ${name}</h2>
  </body>
</html>