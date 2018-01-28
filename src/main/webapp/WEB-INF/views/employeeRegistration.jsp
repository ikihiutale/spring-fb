<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Employee Registration Form</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
  </head>
  <body>
    <div class="container">
      <h2>Registration Form</h2>
      <form:form class="form-horizontal" method="POST" modelAttribute="employee">
        
        <form:input type="hidden" path="id" id="id"/>
        
        <spring:bind path="name">
          <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Name</label>
            <div class="col-sm-10">
              <form:input path="name" type="text" class="form-control " id="name" placeholder="Name" />
              <form:errors path="name" class="control-label" />
            </div>
          </div>
        </spring:bind>

        <spring:bind path="joiningDate">
          <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Joining Date</label>
            <div class="col-sm-10">
              <form:input path="joiningDate" type="text" class="form-control " id="joiningDate" placeholder="Joining Date" />
              <form:errors path="joiningDate" class="control-label" />
            </div>
          </div>
        </spring:bind>

        <spring:bind path="salary">
          <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Salary</label>
            <div class="col-sm-10">
              <form:input path="salary" type="text" class="form-control " id="salary" placeholder="Salary" />
              <form:errors path="salary" class="control-label" />
            </div>
          </div>
        </spring:bind>
    
        <spring:bind path="ssn">
          <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">SSN</label>
            <div class="col-sm-10">
              <form:input path="ssn" type="text" class="form-control " id="ssn" placeholder="SSN" />
              <form:errors path="ssn" class="control-label" />
            </div>
          </div>
        </spring:bind>

        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <c:choose>
              <c:when test="${edit}">
                <button type="submit" class="btn-lg btn-primary pull-right">Update</button>
              </c:when>
              <c:otherwise>
                <button type="submit" class="btn-lg btn-primary pull-right">Register</button>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </form:form>
      
      <div class="jumbotron">
        <a class="btn btn-lg btn-primary" href="<c:url value='/list-employees' />" role="button">List of All Employees</a>
      </div>
    </div>  
  </body>
</html>