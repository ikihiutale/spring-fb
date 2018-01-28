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
      <h2>List of Employees</h2>	
      <table class="table table-striped">
      	<sec:authorize access="hasRole('ROLE_USER')">
	      <p>
	      	This text is only visible to a user
		  </p>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
	      <p>
	      	This text is only visible to an admin
		  </p>
		</sec:authorize>

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
  </body>
</html>