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
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">IEDb</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li class="active"><a href="login.jsp">Log In</a></li>
            <li><a href="#signup" >Sign Up</a></li>            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
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
