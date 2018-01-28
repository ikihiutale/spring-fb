<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Login</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
    <div class="container">
      <!-- Navigation bar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Spring FB</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="<c:url value="/logout" />">Logout</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="container">      
        <div class="login-container">
		  <div class="login-card">
            <div class="login-form">
		      <c:url var="loginUrl" value="/login" />
		      <form action="${loginUrl}" method="post" class="form-horizontal">
                <c:if test="${param.error != null}">
                  <div class="alert alert-danger">
			       <p>Invalid username or password.</p>
                  </div>
                </c:if>
                <c:if test="${param.logout != null}">
		          <div class="alert alert-success">
			       <p>You have been logged out successfully.</p>
                  </div>
                </c:if>
                <div class="input-group input-sm">
                  <label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
                </div>
                <div class="input-group input-sm">
                  <label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label> 
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                <div class="form-actions">
                  <input type="submit" class="btn btn-block btn-primary btn-default" value="Log in">
                </div>
              </form>
            </div> <!-- login-form -->
          </div> <!-- login-card -->
        </div> <!-- login-container -->
      </div> <!-- container -->
    </div> <!-- container -->
  </body>
</html>