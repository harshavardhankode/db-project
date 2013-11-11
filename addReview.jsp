<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>

<html>
	<head>
		<title> Add a laptop </title>
	</head>
	<body>

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

				String userName   = (String)session.getAttribute("username");
				String permission = (String)session.getAttribute("permission");

				if(permission == null){
		%>
					<p> please <a href = login.jsp> login </a> to enter a review </p>

		<%
				}
				else if(permission.equals("admin") || permission.equals("normal"))
				{
					String content = request.getParameter("content");
					String pid = request.getParameter("pid");
					String rating = request.getParameter("rating");

					Statement s = myConnection.createStatement();
					String query = "SELECT review_id FROM reviews WHERE egood_id = "+pid+" AND username = '" + userName + "'";  
					ResultSet rs = s.executeQuery(query);

					if(rs.next()){
						String r_id = rs.getString("review_id");
						query = "UPDATE review SET content = '"+ content +"',rating =" + rating +" WHERE id = " + r_id +";";
						s.executeUpdate(query);
						out.println("<h2> Successfully updated your review </h2> ");

					}
					else{
						query = "INSERT INTO review(content,rating) values('"+ content +"'," + rating +");";
						s.executeUpdate(query);
						query = "SELECT max(id) FROM review;";
						rs = s.executeQuery(query);
						rs.next();
						String review_id = rs.getString(1);	
						query = "INSERT INTO reviews(review_id,username,egood_id) values(" +review_id+ ",'"+userName+"',"+pid+")";
						s.executeUpdate(query);
						out.println("<h2> Successfully Added your review </h2> ");					
					}

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
