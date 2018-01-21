<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Registration Confirmation Page</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
  </head>
  <body>
    <div class="container">
      <div class="jumbotron">
        <h1>message : ${success}</h1>
        <a class="btn btn-lg btn-primary" href="<c:url value='/list' />" role="button">List of All Employees</a>
      </div>
    </div>
  </body>
</html>