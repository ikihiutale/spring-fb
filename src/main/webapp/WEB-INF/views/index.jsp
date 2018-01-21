<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
  </head>
  <body>
    <div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="addGoal.html">
            Get started
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="hero-unit">
        <div>
          <h1>
            Welcome to Fitness Tracker!
          </h1>
          <p>
            To get started, we need to enter a goal for what we want to exercise for
            today.
          </p>
        </div>
        <a class="btn btn-primary" href="addGoal.html">
          Add Goal »
        </a>
        
        <a class="btn btn-primary" href="addMinutes.html">
          Add Exercise Minutes »
        </a>
      </div>
      <div>
      </div>
    </div>
    <script src="<c:url value="/resources/js/jquery-2.2.4.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
  </body>
</html>
