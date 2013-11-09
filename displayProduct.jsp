<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title> Product Info </title>
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

				String product_id = request.getParameter("id");	
	
				Statement s = myConnection.createStatement();
				String query = "SELECT * FROM electronic_goods WHERE pid = "+product_id + "";
	
				ResultSet rs = s.executeQuery(query);

				if(rs.next()){ 
		%>
					<h3> manf : <%=  rs.getString(4) %> </h3> 
					<h3> name : <%=  rs.getString(5) %> </h3> 
					<h3> type : <%=  rs.getString(6) %> </h3> 
		<%				
				}
				else{
					out.println("<h1> Product not found </h1>");
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

	</body>
</html>
