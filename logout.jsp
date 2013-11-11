<%
	session.invalidate();
%>

<html>
	<head>
		<title>	Logout </title>
		<style type="text/css">
   			<%@ include file="dist/css/bootstrap.min.css" %>
   			<%@ include file="dist/signin.css" %>
  		</style>
	</head>
	<body>
		<h2> Successfully Logged out! </h2>
		<a href = "login.jsp"> Go to the login page </a>
	</body>
</html>
