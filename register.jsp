<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<html>
<head>
 <title>IIT Bombay Electronics Database Sign Up</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <style type="text/css">
   <%@ include file="dist/css/bootstrap.min.css" %>
   <%@ include file="dist/signin.css" %>
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
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
           <li><a class="navbar-brand" href="index.jsp">IEDb</a></li>
            <li><a href="searchlaptops.jsp">Search</a></li>
            <li><a href="about.jsp">About</a></li>
            
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

				String name_in = request.getParameter("name");
				String emailid_in = request.getParameter("emailid");
				String user_in = request.getParameter("username");	
				String pass_in = request.getParameter("password");
				String repass_in = request.getParameter("repassword");
					
				if (pass_in.equals(repass_in)){
					Statement s = myConnection.createStatement();
					String query = "SELECT * FROM users WHERE username = '" + user_in + "';";
	
					ResultSet rs = s.executeQuery(query);

					if(rs.next()){ 
						
		%>
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
					
					<p class="invalid"> The username is taken!</p>
		<%				
					}
					else{
						query = "INSERT INTO users VALUES('" + name_in + "','" + user_in + "','" + pass_in + "','" + emailid_in + "', 'normal');";
						s.executeUpdate(query);
		%>
								<li class="active"><a href="login.jsp">Log In</a></li>
							<li><a href="signup.jsp" >Sign Up</a></li>            
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
					 
					 <p class="valid"> You are successfully registered! Please login to continue.</p>
		<%			}
				}
				else{
		%>
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
					
					<p class="invalid"> Password re-entered is wrong!</p>
		<%		}

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
	</body>
</html>
