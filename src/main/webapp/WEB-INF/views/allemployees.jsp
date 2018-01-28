<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Employees</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
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

      <div class="panel panel-default">      
        <h2>List of Employees</h2>	
        <sec:authorize access="hasRole('ROLE_ADMIN')">
  	 	<p>
            This text is only visible to a ROLE_ADMIN
  		</p>
  	  </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
  	   <p>
  	     This text is only visible to an ROLE_USER
  	   </p>
        </sec:authorize>
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Name..</th>
              <th>Joining Data</th>
              <th>Salary</th>
              <th>SSN</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${employees}" var="employee">
              <tr>
    			<td>${employee.name}</td>
    			<td>${employee.joiningDate}</td>
    			<td>${employee.salary}</td>
    			<td><a href="<c:url value='/edit-${employee.ssn}-employee' />">${employee.ssn}</a></td>
    			<td><a href="<c:url value='/delete-${employee.ssn}-employee' />">delete</a></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
          <div class="jumbotron">
            <a class="btn btn-lg btn-primary" href="<c:url value='/new' />" role="button">Add New Employee</a>
        </div>
      </div>
    </div>
  </body>
</html>