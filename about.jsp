<html>
<head>
 <title>IIT Bombay Electronics Database Login</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <style type="text/css">
   <%@ include file="dist/css/bootstrap.min.css" %>
   <%@ include file="dist/signin.css" %>
   <%@ include file="dist/starter-template.css" %>
  </style>
</head>

<body class="starter-template">
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
            <li class=active><a href="about.jsp">About</a></li>
            <% if (session.getAttribute("permission")==null) {
            %>
            <li><a href="login.jsp">Log In</a></li>
            <li><a href="signup.jsp" >Sign Up</a></li>
            <%
            }
            else{
            	if(session.getAttribute("permission").equals("admin")){		
			%>     
					<li><a href="addLaptopInterface.jsp" >Admin Interface</a></li>
			<%
					}
			%> 
            	<li><a >Logged In as  <%=session.getAttribute("name") %></a></li> 
            	<li><a href="logout.jsp" >Log out</a></li>
            <%}
            %>             
          </ul>
        </div>
      </div>
    </div>
    
     <div class="container">

      <div class="starter-template">
        <h1>IEDb&nbsp;(IITB Electronics Database)</h1>
        <p class="lead">This is IITB's first electronics database. This is a project made for CS387 course.</p>
        <p class="lead">
        Harsha Vardhan<br>
        Nishant Nori<br>
        Charan Teja<br>
        Dev Narayan<br>
        </p>
        
      </div>

    </div><!-- /.container -->
    
    
</body>
</html>
