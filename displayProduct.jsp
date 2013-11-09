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

				String type=null;

				ResultSet rs = s.executeQuery(query);

				if(rs.next()){ 
					type = rs.getString("type");					
				}
				else{
					out.println("<h1> Product not found </h1>");
				}


				if(type.equals("laptop")){
					query = "SELECT * FROM laptops WHERE pid = "+product_id + "";
					rs = s.executeQuery(query);
					rs.next();
		%>			
					<h2> Laptop Info </h2>
					<table> 
						<tr> <th> Attribute </th> <th> Value </th> </tr>
						<tr> <td> Manufacturer </td> <td> <%=rs.getString("manf") %> </td> </tr>
						<tr> <td> Product Name </td> <td> <%=rs.getString("pname") %> </td> </tr>
						<tr> <td> Price in Rupees</td> <td> <%=rs.getString("cost") %> </td> </tr>
						<tr> <td> Weight in kg</td> <td> <%=rs.getString("weight") %> </td> </tr>
						<tr> <td> OS</td> <td> <%=rs.getString("os") %> </td> </tr>
						<tr> <td> Hard Disk size</td> <td> <%=rs.getString("hard_disk") %> </td> </tr>
						<tr> <td> Speakers</td> <td> <%=rs.getString("speakers") %> </td> </tr>
						<tr> <td> Network Adaptor</td> <td> <%=rs.getString("network_adaptor") %> </td> </tr>
						<tr> <td> Chipset</td> <td> <%=rs.getString("chipset") %> </td> </tr>
						<tr> <td> Battery </td> <td> <%=rs.getString("battery") %> </td> </tr>
						<tr> <td> Screen Size</td> <td> <%=rs.getString("screen_size") %> </td> </tr>
						<tr> <td> Screen Resolution</td> <td> <%=rs.getString("screen_resolution") %> </td> </tr>
					</table>
		<%

					int ram_id = rs.getInt("ram_id");
					int proc_id = rs.getInt("proc_id");
					int gcard_id = rs.getInt("gcard_id");

					query = "SELECT * FROM ram WHERE id = "+ram_id+ "";
					ResultSet rs1 = s.executeQuery(query);
					rs1.next();
	
					query = "SELECT * FROM processor WHERE id = "+proc_id+ "";
					ResultSet rs2 = s.executeQuery(query);
					rs2.next(); // add null detection

					query = "SELECT * FROM graphics_card WHERE id = "+gcard_id+ "";
					ResultSet rs3 = s.executeQuery(query);
		%>
					<h2> Ram Info </h2>
					<table> 
						<tr> <th> Attribute </th> <th> Value </th> </tr>
						<tr> <td> Size </td> <td> <%=rs1.getString("size") %> </td> </tr>
						<tr> <td> Type </td> <td> <%=rs1.getString("type") %> </td> </tr>
					</table>
				
					<h2> Processor Info </h2>
					<table> 
						<tr> <th> Attribute </th> <th> Value </th> </tr>
						<tr> <td> Manufacturer </td> <td> <%=rs2.getString("manf") %> </td> </tr>
						<tr> <td> Name </td> <td> <%=rs2.getString("pname") %> </td> </tr>
						<tr> <td> Cores</td> <td> <%=rs.getString("cores") %> </td> </tr>
						<tr> <td> Clocl Speed</td> <td> <%=rs.getString("clock_speed") %> </td> </tr>
					</table>
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


			//String[] attribs{"pid","cost","weight","manf","pname","os","speakers","network_adaptor","chipset","battery","screen_size","hard_disk","screen_resolution","ram_id","proc_id","gcard_id"}

		%>

	</body>
</html>
