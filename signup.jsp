<html>
<head>
 <title>IIT Bombay Electronics Database Sign Up</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <style type="text/css">
   <%@ include file="dist/css/bootstrap.min.css" %>
   <%@ include file="dist/signin.css" %>
  </style>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
           <li><a class="navbar-brand" href="index.jsp">IEDb</a></li>
            <li><a href="searchlaptops.jsp">Search</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="login.jsp">Log In</a></li>
            <li class="active"><a href="signup.jsp" >Sign Up</a></li>            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
 <div class="container">
  <form name="loginForm" method="post" action="register.jsp" class="form-signin">
   <h2 class="form-signin-heading">Register</h2>
   <input type="text" name="name" class="form-control" placeholder="Name" required>
   <input type="text" name="emailid" class="form-control" placeholder="Email ID" required>
   <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
   <input type="password" name="password" class="form-control" placeholder="Password" required>
   <input type="password" name="repassword" class="form-control" placeholder="Retype Password" required>
   
   <button class="btn btn-lg btn-primary btn-block" type="Submit" name="Submit" value="Signup">Sign Up</button>
  </form>
 </div>
       
</body>
</html>
