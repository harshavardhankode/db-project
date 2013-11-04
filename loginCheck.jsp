<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title> Login Check </title>
	</head>
	<body>
		<%
			try 
			{
				String driver = "org.postgresql.Driver";
				String url = "jdbc:postgresql://localhost:5432/db_project";
				String username = "srichaitanya"; // Enter your PostgreSQL username
				String password = "pass1234"; // Enter your PostgreSQL password
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
		%>
					<h1>Hello  <%=rs.getString(1) %>   </h1>
					<h3> <a href= "interface.jsp">Continue to database interface </a> </h2>
		<%				
				}
				else{
					out.println("<h1> User not found </h1>");
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
		<a href= "login.jsp"> BACK </a>
	</body>
</html>
