<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title> Login Check </title>
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
          <a class="navbar-brand" href="#">IEDb</a>
        </div>
        <div class="collapse navbar-collapse navbar-fixed">
          <ul class="nav navbar-nav">
            <li><a href="searchlaptops.jsp">Search</a></li>
            <li><a href="#about">About</a></li>
            
		<%
			try 
			{
				String driver = "org.postgresql.Driver";
				String url = "jdbc:postgresql://localhost:5432/nishant";
				String username = "nishant"; // Enter your PostgreSQL username
				String password = "newpassword"; // Enter your PostgreSQL password
				Connection myConnection = null;
				Class.forName(driver).newInstance();
				myConnection = DriverManager.getConnection(url,username,password);


				String user_in = request.getParameter("username");	
				String pass_in = request.getParameter("password");
	
				Statement s = myConnection.createStatement();
				String query = "SELECT * FROM users WHERE username = '"+user_in+"' AND password= '"+pass_in+"'";
	
				ResultSet rs = s.executeQuery(query);

				if(rs.next()){ 
					session.setAttribute("name" , rs.getString(1) );
					session.setAttribute("username" , rs.getString(2) );
					session.setAttribute("permission" , rs.getString(5) );
					
					if(session.getAttribute("permission").equals("admin")){		
		%>     
							<li><a href="addLaptopInterface.jsp" >Admin Interface</a></li>
		<%
					}
		%> 
							<li><a >Logged In as  <%=rs.getString(1) %></a></li> 
							<li><a href="logout.jsp" >Log out</a></li>
		
				  		</ul>
			   		   </div>
			  		 </div>
					</div>
    				<h1  class="starter-template">Hello  <%=rs.getString(1) %>   </h1>
					<h3  class="starter-template"> <a href= "searchlaptops.jsp">Continue to database interface </a> </h2>

		<%				
				}
				else{
		%>
							<li class="active"><a href="login.jsp">Log In</a></li>
            				<li><a href="#signup" >Sign Up</a></li>
						</ul>
			   		   </div>
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
					 <p class="invalid"> Invalid credentials! <br> Please check your username and password.</p>
					 
		<%
				}

				myConnection.close();

			}
			catch(ClassNotFoundException e){e.printStackTrace();}
			catch (SQLException ex)
			{
				out.print("SQLException: "+ex.getMessage());
				out.print("SQLState: " + ex.getSQLState());
				out.print("VendorError: " + ex.getErrorCode());
			}
		%>
		<!--<p><a href= "login.jsp"> BACK </a></p>-->
	</body>
</html>
