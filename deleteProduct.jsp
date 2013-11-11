<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>

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
          	<li class=active><a class="navbar-brand" href="index.jsp">IEDb</a></li>
            <li><a href="searchlaptops.jsp">Search</a></li>
            <li><a href="about.jsp">About</a></li>
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

		<%
			
				
			try 
			{
				String driver = "org.postgresql.Driver";
				String url = "jdbc:postgresql://localhost:5432/nishant";
				String username = "nishant"; // Enter your PostgreSQL username
				String password = "newpassword"; // Enter your PostgreSQL password
				Connection myConnection = null;
				Class.forName(driver).newInstance();
				//myConnection = DriverManager.getConnection(url,username,password);
				
				
				String pid = request.getParameter("id");
				if (!(session.getAttribute("permission")==null) && session.getAttribute("permission").equals("admin")){
					myConnection = DriverManager.getConnection(url,username,password);	
	
					Statement s = myConnection.createStatement();
					
					
					
					String query = "DELETE FROM electronic_goods WHERE pid = "+pid;
					//Entry in respective laptops/mobilephones/tablets will also get deleted due to cascade foreign key
					s.executeUpdate(query);
					out.println("<h2 class=\"starter-template\"> Successfully deleted the product </h2>");
		%>
					<form name="loginForm" method="post" action="searchlaptops.jsp" class="form-signin form-new">
							<button class="btn btn-lg btn-primary">Back</button>		
					</form>	
		
		<%

				}
				
				else {
					out.println("<h1 class=\"starter-template\">You need to be an administrator to make these changes in the website. </h1>");
		%>
					<form name="loginForm" method="post" action="displayProduct.jsp?id=<%= pid %>" class="form-signin form-new">
							<button class="btn btn-lg btn-primary">Back</button>		
					</form>	
		<%
				}

			}
			catch(ClassNotFoundException e){e.printStackTrace();}
			catch (SQLException ex)
			{
				out.print("SQLException: "+ex.getMessage());
				out.print("SQLState: " + ex.getSQLState());
				out.print("VendorError: " + ex.getErrorCode());
			}
		%>

	</body>
</html>
