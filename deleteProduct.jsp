<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>

<html>
	<head>
		<title> Delete a product </title>
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
				//myConnection = DriverManager.getConnection(url,username,password);
				
				
				
				if (!(session.getAttribute("permission")==null) && session.getAttribute("permission").equals("admin")){
					myConnection = DriverManager.getConnection(url,username,password);	
	
					Statement s = myConnection.createStatement();
					
					String pid = request.getParameter("id");
					
					String query = "DELETE FROM electronic_goods WHERE pid = "+pid;
					//Entry in respective laptops/mobilephones/tablets will also get deleted due to cascade foreign key
					s.executeUpdate(query);
					out.println("<h2> Successfully deleted the product </h2>");

				}
				
				else {
					out.println("<h1>Not admin</h1>");
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
