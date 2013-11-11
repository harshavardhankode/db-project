<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title> Product Info </title>
		<style type="text/css">
   			<%@ include file="dist/css/bootstrap.min.css" %>
   			<%@ include file="dist/signin.css" %>
  		</style>
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
				


					int ram_id=0;
					int proc_id=0;
					int gcard_id=0;

					if(type.equals("laptop")){
						query = "SELECT * FROM laptops WHERE pid = "+product_id + "";
						rs = s.executeQuery(query);
						rs.next();
			%>			
						<h2> Laptop Info </h2>
						<table class="table table-bordered table-striped table-nonfluid"> 
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

						ram_id = rs.getInt("ram_id");
						proc_id = rs.getInt("proc_id");
						gcard_id = rs.getInt("gcard_id");
					

					}
					else if(type.equals("mobile")){
						query = "SELECT * FROM mobile_phones WHERE pid = "+product_id + "";
						rs = s.executeQuery(query);
						rs.next();
			%>			
						<h2> Mobile Phone Info </h2>
						<table class="table table-striped table-bordered table-nonfluid"> 
							<tr> <th> Attribute </th> <th> Value </th> </tr>
							<tr> <td> Manufacturer </td> <td> <%=rs.getString("manf") %> </td> </tr>
							<tr> <td> Product Name </td> <td> <%=rs.getString("pname") %> </td> </tr>
							<tr> <td> Price in Rupees</td> <td> <%=rs.getString("cost") %> </td> </tr>
							<tr> <td> Weight in kg</td> <td> <%=rs.getString("weight") %> </td> </tr>
							<tr> <td> OS</td> <td> <%=rs.getString("os") %> </td> </tr>
							<tr> <td> Internal Memory</td> <td> <%=rs.getString("internal_memory") %> </td> </tr>
							<tr> <td> Sim</td> <td> <%=rs.getString("sim") %> </td> </tr>
							<tr> <td> Screen Type</td> <td> <%=rs.getString("screen_type") %> </td> </tr>
							<tr> <td> Screen Size</td> <td> <%=rs.getString("screen_size") %> </td> </tr>
							<tr> <td> Screen Resolution</td> <td> <%=rs.getString("screen_resolution") %> </td> </tr>
						</table>
			<%

						ram_id = rs.getInt("ram_id");
						proc_id = rs.getInt("proc_id");
						gcard_id = 0;
					

					}
					else if(type.equals("tablet")){
						query = "SELECT * FROM tablets WHERE pid = "+product_id + "";
						rs = s.executeQuery(query);
						rs.next();
			%>			
						<h2> Tablet Info </h2>
						<table class="table table-striped table-bordered table-nonfluid" > 
							<tr> <th> Attribute </th> <th> Value </th> </tr>
							<tr> <td> Manufacturer </td> <td> <%=rs.getString("manf") %> </td> </tr>
							<tr> <td> Product Name </td> <td> <%=rs.getString("pname") %> </td> </tr>
							<tr> <td> Price in Rupees</td> <td> <%=rs.getString("cost") %> </td> </tr>
							<tr> <td> Weight in kg</td> <td> <%=rs.getString("weight") %> </td> </tr>
							<tr> <td> OS</td> <td> <%=rs.getString("os") %> </td> </tr>
							<tr> <td> Internal Memory</td> <td> <%=rs.getString("internal_memory") %> </td> </tr>
							<tr> <td> 3G</td> <td> <%=rs.getString("three_g") %> </td> </tr>
							<tr> <td> Wifi</td> <td> <%=rs.getString("wifi") %> </td> </tr>
							<tr> <td> Screen Type</td> <td> <%=rs.getString("screen_type") %> </td> </tr>
							<tr> <td> Screen Size</td> <td> <%=rs.getString("screen_size") %> </td> </tr>
							<tr> <td> Screen Resolution</td> <td> <%=rs.getString("screen_resolution") %> </td> </tr>
							<tr> <td> Battery </td> <td> <%=rs.getString("battery") %> </td> </tr>
						</table>
			<%

						ram_id = rs.getInt("ram_id");
						proc_id = rs.getInt("proc_id");
						gcard_id = rs.getInt("gcard_id");
					

					}			


					// Here is ram , graphics card info

					ResultSet  rs1 = null;
					if(ram_id!= 0) {
						query = "SELECT * FROM ram WHERE id = "+ram_id+ "";
						rs1 = s.executeQuery(query);
				
				
						rs1.next();


			%>
						<h2> RAM </h2>
						<table class="table table-striped table-bordered table-nonfluid"> 
							<tr> <th> Attribute </th> <th> Value </th> </tr>
							<tr> <td> Size </td> <td> <%=rs1.getString("size") %> </td> </tr>
							<tr> <td> Type </td> <td> <%=rs1.getString("type") %> </td> </tr>
						</table>
			<%	
					}	
					else {
						out.println("<h2> No Ram info</h2>");
					}

					if(proc_id!= 0) {
						query = "SELECT * FROM processor WHERE id = "+proc_id+ "";
						rs1 = s.executeQuery(query);

						rs1.next();
			%>		
						<h2> Processor </h2>
						<table class="table table-striped table-bordered table-nonfluid"> 
							<tr> <th> Attribute </th> <th> Value </th> </tr>
							<tr> <td> Manufacturer </td> <td> <%=rs1.getString("manf") %> </td> </tr>
							<tr> <td> Name </td> <td> <%=rs1.getString("pname") %> </td> </tr>
							<tr> <td> Cores</td> <td> <%=rs1.getString("cores") %> </td> </tr>
							<tr> <td> Clock Speed</td> <td> <%=rs1.getString("clock_speed") %> </td> </tr>
						</table>
			<%		
					}
					else {
						out.println("<h2> No Processor info</h2>");
					}					

					if(gcard_id!= 0) {
						query = "SELECT * FROM graphics_card WHERE id = "+gcard_id+ "";
						rs1 = s.executeQuery(query);
			
						rs1.next();
			%>		
						<h2> Graphic card Info </h2>
						<table class="table table-striped table-bordered table-nonfluid"> 
							<tr> <th> Attribute </th> <th> Value </th> </tr>
							<tr> <td> Manufacturer </td> <td> <%=rs1.getString("manf") %> </td> </tr>
							<tr> <td> Name </td> <td> <%=rs1.getString("pname") %> </td> </tr>
							<tr> <td> Memory</td> <td> <%=rs1.getString("memory") %> </td> </tr>
							<tr> <td> Type</td> <td> <%=rs1.getString("type") %> </td> </tr>
						</table>
			<%		
					}
					else {
						out.println("<h2> No Graphic card info</h2>");
					}	

			
					//reviews:	

					query = "SELECT * FROM reviews WHERE egood_id = "+product_id+ "";		
					rs = s.executeQuery(query);

					Statement s2 = myConnection.createStatement();

					out.println("<h2> Reviews </h2> ");
					out.println("<table> \n <tr> <th> User </th> <th> Rating </th> <th> Review </th> <th> Timestamp </th> </tr> ");
					while(rs.next())
					{
	
						int rev_id = rs.getInt("review_id");
						String r_uName = rs.getString("username");
						query = "SELECT * FROM review WHERE id = "+rev_id+ "";
						rs1 = s2.executeQuery(query);
						rs1.next();
			%>
						<tr> <td> <%= r_uName %> </td> <td> <%=rs1.getString("rating") %> </td> <td> <%=rs1.getString("content") %> </td> <td> <%=rs1.getString("time_stamp") %> </td> </tr>

			<%			

					}

					out.println("</table> ");

				//Add a review

			%>
					<h2> Add a review </h2>
			
					<form method="post" action="addReview.jsp?pid=<%= product_id %>" >
						<label> Rating: </label>  <input type="text" name="rating">
						<label> Content: </label> <input type="textarea" name="content">
						<input type="Submit" value="Add/Update Review">
					</form>
			<%

				//Option to delete the product , only for admin
					if (!(session.getAttribute("permission")==null) && session.getAttribute("permission").equals("admin")){
			%>

					<a href= "deleteProduct.jsp?id=<%=product_id%>"> Delete this Product </a>
					 
			<%		
					}
				}
				else{
					out.println("<h2> Product not found </h2>");
				}




				myConnection.close();



			}
			catch(ClassNotFoundException e){e.printStackTrace();}
			catch (SQLException ex)
			{
				out.println("SQLException: "+ex.getMessage());
				out.println("SQLState: " + ex.getSQLState());
				out.println("VendorError: " + ex.getErrorCode());
			}


		%>

	</body>
</html>
