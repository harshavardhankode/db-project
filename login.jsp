<html>
<head>
 <title>IIT Bombay Electronics Database Login</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <style type="text/css">
   <%@ include file="dist/css/bootstrap.min.css" %>
   <%@ include file="dist/signin.css" %>
  </style>
</head>

<body>

 <div class="container">
  <form name="loginForm" method="post" action="loginCheck.jsp" class="form-signin">
   <h2 class="form-signin-heading">Log In</h2>
   <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
   <input type="password" name="password" class="form-control" placeholder="Password" required>
   <button class="btn btn-lg btn-primary btn-block" type="Submit" name="Submit" value="Login">Sign in</button>
  </form>
 </div>
       
</body>
</html>
