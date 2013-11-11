<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
   
    <style type="text/css">
		<%@ include file="dist/css/bootstrap.min.css" %>
		<%@ include file="dist/starter-template.css" %>
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
            <li><a href="searchlaptops.jsp">Search</a></li>
            <li><a href="#about">About</a></li>
            <% if (session.getAttribute("permission")==null) {
            %>
            <li><a href="login.jsp">Log In</a></li>
            <li><a href="#signup" >Sign Up</a></li>
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
        <p class="lead">This is IITB's first electronics database. </p>
      </div>

    </div><!-- /.container -->
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
  </body>
</html>
