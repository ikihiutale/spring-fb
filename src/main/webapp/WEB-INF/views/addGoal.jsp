<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <title>Add goal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
  </head>
  <body>
    <div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">Add Goal</a>
          <ul class="nav"></ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div>
        <h1>Add Goal</h1>
        <p>
          Add your workout goal in minutes for the day.
          <br>
          &nbsp;
        </p>
      </div>
      
      <form:form commandName="goal">
		<form:errors path="*" cssClass="errorblock" element="div" />
			<label for="textinput1">Enter Minutes:</label>	
			<form:input path="minutes" cssErrorClass="error" />
			<form:errors path="minutes" cssClass="error" />
			<br/>
			<input type="submit" class="btn" value="Enter Goal Minutes"/>
	  </form:form>
     
      <div class="control-group">
      </div>
    </div>
    <script src="<c:url value="/resources/js/jquery-2.2.4.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
  </body>
</html>
