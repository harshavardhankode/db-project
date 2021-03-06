<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>

<html>
	<head>
		<title> Product Info </title>
		
   			<link rel="stylesheet" type="text/css" href="./dist/css/bootstrap.min.css">
   			
   			<link rel="stylesheet" type="text/css" href="./dist/starter-template.css">
   			<link rel="stylesheet" type="text/css" href="./dist/signin.css">
  		
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
            <li class="active"><a href="searchlaptops.jsp">Search</a></li>
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
    
     <div class="navbar navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        
        <div class="collapse navbar-collapse" >        
		      <ul class="nav navbar-nav">
		        <li><a href="searchlaptops.jsp">Laptops</a></li>
		        <li><a href="searchmobiles.jsp">Mobiles</a></li>
		        <li><a href="searchtablets.jsp">Tablets</a></li>            
		      </ul>
		    </div>
		  </div>
		</div>
    
    
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

				String product_type = request.getParameter("type");					
				//out.println(product_type);
		
				Statement s = myConnection.createStatement();
				ResultSet rs = null;			

				if(product_type.equals("laptop")){
					
					String query = "SELECT * FROM laptops WHERE TRUE";
					
					if(!request.getParameter("CostMin").trim().equals("")){
						query = query + " AND cost >= " + request.getParameter("CostMin");
					}
					
					if(!request.getParameter("CostMax").trim().equals("")){
						query = query + " AND cost <= " + request.getParameter("CostMax");
					}

					if(!request.getParameter("Manufacturer").trim().equals("")){
						query = query + " AND manf = '" + request.getParameter("Manufacturer")+"'";
					}	

					if(!request.getParameter("OS").trim().equals("")){
						query = query + " AND os = '" + request.getParameter("OS")+"'";
					}	

					if(!request.getParameter("Speakers").trim().equals("")){
						query = query + " AND speakers = '" + request.getParameter("Speakers")+"'";
					}	
				
					if(!request.getParameter("NetworkAdaptor").trim().equals("")){
						query = query + " AND network_adaptor = '" + request.getParameter("NetworkAdaptor")+"'";
					}	

					if(!request.getParameter("Chipset").trim().equals("")){
						query = query + " AND chipset = '" + request.getParameter("Chipset")+"'";
					}	

					if(!request.getParameter("Battery").trim().equals("")){
						query = query + " AND battery = '" + request.getParameter("Battery")+"'";
					}	

					if(!request.getParameter("ScreenSizeMin").trim().equals("")){
						query = query + " AND  CAST(coalesce(screen_size, '0') AS real)  >= " + request.getParameter("ScreenSizeMin")+"";
					}	

					if(!request.getParameter("ScreenSizeMax").trim().equals("")){
						query = query + " AND CAST(coalesce(screen_size, '0') AS real) <= " + request.getParameter("ScreenSizeMax")+"";
					}	

					if(!request.getParameter("HardDiskMin").trim().equals("")){
						query = query + " AND  CAST(coalesce(hard_disk, '0') AS real)  >= " + request.getParameter("HardDiskMin")+"";
					}	

					if(!request.getParameter("HardDiskMax").trim().equals("")){
						query = query + " AND CAST(coalesce(hard_disk, '0') AS real) <= " + request.getParameter("HardDiskMax")+"";
					}	

					if(!request.getParameter("ScreenResolution").trim().equals("")){
						query = query + " AND screen_resolution = '" + request.getParameter("ScreenResolution")+"'";
					}	

					String ram_query = " True";
					String proc_query = " True";
					String gcard_query = " True";


					if(!request.getParameter("RamSize").trim().equals("")){
						ram_query = ram_query + " AND size ='"+ request.getParameter("RamSize")+"'";
					}

					if(!request.getParameter("RamType").trim().equals("")){
						ram_query = ram_query + " AND type ='"+ request.getParameter("RamType")+"'";
					}

					if(!ram_query.equals(" True"))			
						query = query + " AND ram_id in (SELECT id FROM ram WHERE" +ram_query+")";

					if(!request.getParameter("ProcessorSpeed").trim().equals("")){
						proc_query = proc_query + " AND clock_speed = '"+ request.getParameter("ProcessorSpeed")+"'";
					}

					if(!request.getParameter("Cores").trim().equals("")){
						proc_query = proc_query + " AND cores = '"+ request.getParameter("Cores")+"'";
					}
	
					if(!proc_query.equals(" True"))
						query = query + " AND proc_id in (SELECT id FROM processor WHERE" +proc_query+")"; 	


					if(!request.getParameter("GraphicsCard").trim().equals("")){
						gcard_query = gcard_query + " AND manf = '"+ request.getParameter("GraphicsCard")+"'";
					}

					if(!gcard_query.equals(" True"))
						query = query + " AND gcard_id in (SELECT id FROM graphics_card WHERE" +gcard_query+")";

					query = query + ";";
					//out.println(query);			
	
					rs = s.executeQuery(query);

				}
				else if(product_type.equals("mobile")){
					
					String query = "SELECT * FROM mobile_phones WHERE TRUE";
					
					if(!request.getParameter("CostMin").trim().equals("")){
						query = query + " AND cost >= " + request.getParameter("CostMin");
					}
					
					if(!request.getParameter("CostMax").trim().equals("")){
						query = query + " AND cost <= " + request.getParameter("CostMax");
					}

					if(!request.getParameter("Manufacturer").trim().equals("")){
						query = query + " AND manf = '" + request.getParameter("Manufacturer")+"'";
					}	

					if(!request.getParameter("OS").trim().equals("")){
						query = query + " AND os = '" + request.getParameter("OS")+"'";
					}	

					if(!request.getParameter("InternalMemory").trim().equals("")){
						query = query + " AND internal_memory = '" + request.getParameter("InternalMemory")+"'";
					}	
				
					if(!request.getParameter("ScreenType").trim().equals("")){
						query = query + " AND screen_type = '" + request.getParameter("ScreenType")+"'";
					}	

					if(!request.getParameter("Sim").trim().equals("")){
						query = query + " AND sim = '" + request.getParameter("Sim")+"'";
					}	

					if(!request.getParameter("Battery").trim().equals("")){
						query = query + " AND battery = '" + request.getParameter("Battery")+"'";
					}	

					if(!request.getParameter("ScreenSizeMin").trim().equals("")){
						query = query + " AND  CAST(coalesce(screen_size, '0') AS real)  >= " + request.getParameter("ScreenSizeMin")+"";
					}	

					if(!request.getParameter("ScreenSizeMax").trim().equals("")){
						query = query + " AND CAST(coalesce(screen_size, '0') AS real) <= " + request.getParameter("ScreenSizeMax")+"";
					}	

					if(!request.getParameter("ScreenResolution").trim().equals("")){
						query = query + " AND screen_resolution = '" + request.getParameter("ScreenResolution")+"'";
					}	

					String ram_query = " True";
					String proc_query = " True";

					if(!request.getParameter("RamSize").trim().equals("")){
						ram_query = ram_query + " AND size ='"+ request.getParameter("RamSize")+"'";
					}

					if(!request.getParameter("RamType").trim().equals("")){
						ram_query = ram_query + " AND type ='"+ request.getParameter("RamType")+"'";
					}

					if(!ram_query.equals(" True"))			
						query = query + " AND ram_id in (SELECT id FROM ram WHERE" +ram_query+")";

					if(!request.getParameter("ProcessorSpeed").trim().equals("")){
						proc_query = proc_query + " AND clock_speed = '"+ request.getParameter("ProcessorSpeed")+"'";
					}

					if(!request.getParameter("Cores").trim().equals("")){
						proc_query = proc_query + " AND cores = '"+ request.getParameter("Cores")+"'";
					}
	
					if(!proc_query.equals(" True"))
						query = query + " AND proc_id in (SELECT id FROM processor WHERE" +proc_query+")"; 	


					query = query + ";";
					//out.println(query);			
	
					rs = s.executeQuery(query);
				}
				else if(product_type.equals("tablet")){
					
					String query = "SELECT * FROM tablets WHERE TRUE";
					
					if(!request.getParameter("CostMin").trim().equals("")){
						query = query + " AND cost >= " + request.getParameter("CostMin");
					}
					
					if(!request.getParameter("CostMax").trim().equals("")){
						query = query + " AND cost <= " + request.getParameter("CostMax");
					}

					if(!request.getParameter("Manufacturer").trim().equals("")){
						query = query + " AND manf = '" + request.getParameter("Manufacturer")+"'";
					}	

					if(!request.getParameter("OS").trim().equals("")){
						query = query + " AND os = '" + request.getParameter("OS")+"'";
					}	

					if(!request.getParameter("InternalMemory").trim().equals("")){
						query = query + " AND internal_memory = '" + request.getParameter("InternalMemory")+"'";
					}	

				
					if(!request.getParameter("ScreenType").trim().equals("")){
						query = query + " AND screen_type = '" + request.getParameter("ScreenType")+"'";
					}	

				
					if(!request.getParameter("3G").trim().equals("")){
						query = query + " AND three_g = '" + request.getParameter("3G")+"'";
					}	

					if(!request.getParameter("Wifi").trim().equals("")){
						query = query + " AND wifi = '" + request.getParameter("Wifi")+"'";
					}	

					if(!request.getParameter("Battery").trim().equals("")){
						query = query + " AND battery = '" + request.getParameter("Battery")+"'";
					}	

					if(!request.getParameter("ScreenSizeMin").trim().equals("")){
						query = query + " AND  CAST(coalesce(screen_size, '0') AS real)  >= " + request.getParameter("ScreenSizeMin")+"";
					}	

					if(!request.getParameter("ScreenSizeMax").trim().equals("")){
						query = query + " AND CAST(coalesce(screen_size, '0') AS real) <= " + request.getParameter("ScreenSizeMax")+"";
					}	

					if(!request.getParameter("ScreenResolution").trim().equals("")){
						query = query + " AND screen_resolution = '" + request.getParameter("ScreenResolution")+"'";
					}	

					String ram_query = " True";
					String proc_query = " True";
					String gcard_query = " True";


					if(!request.getParameter("RamSize").trim().equals("")){
						ram_query = ram_query + " AND size ='"+ request.getParameter("RamSize")+"'";
					}

					if(!request.getParameter("RamType").trim().equals("")){
						ram_query = ram_query + " AND type ='"+ request.getParameter("RamType")+"'";
					}

					if(!ram_query.equals(" True"))			
						query = query + " AND ram_id in (SELECT id FROM ram WHERE" +ram_query+")";

					if(!request.getParameter("ProcessorSpeed").trim().equals("")){
						proc_query = proc_query + " AND clock_speed = '"+ request.getParameter("ProcessorSpeed")+"'";
					}

					if(!request.getParameter("Cores").trim().equals("")){
						proc_query = proc_query + " AND cores = '"+ request.getParameter("Cores")+"'";
					}
	
					if(!proc_query.equals(" True"))
						query = query + " AND proc_id in (SELECT id FROM processor WHERE" +proc_query+")"; 	


					if(!request.getParameter("GraphicsCard").trim().equals("")){
						gcard_query = gcard_query + " AND manf = '"+ request.getParameter("GraphicsCard")+"'";
					}

					if(!gcard_query.equals(" True"))
						query = query + " AND gcard_id in (SELECT id FROM graphics_card WHERE" +gcard_query+")";

					query = query + ";";
					//out.println(query);			
	
					rs = s.executeQuery(query);

				}
				%>
				<table class="table table-bordered table-striped table-nonfluid"> 
				
				<%
				while(rs.next()){
		%>		

				<tr> <th> <a href = displayProduct.jsp?id=<%= rs.getString("pid")%> >   <%= rs.getString("manf")%>  <%= rs.getString("pname")%> </th> </tr>

		<%

				}

				%>
				</table>
				<%

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
