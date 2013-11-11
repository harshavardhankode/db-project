<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>


<html>
	<head>
		<title>Laptop Search Page</title>
		<meta charset="utf-8" />
		<style type="text/css">
   			<%@ include file="dist/css/bootstrap.min.css" %>
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
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="searchlaptops.jsp">Search</a></li>
            <li><a href="#about">About</a></li>
            <% if (session.getAttribute("permission")==null) {
            %>
            <li><a href="login.jsp">Log In</a></li>
            <li><a href="#signup" >Sign Up</a></li>
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
            <li class="active"><a href="searchlaptops.jsp">Laptops</a></li>
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

				Set<String> set_manf = new HashSet<String>();
				Set<String> set_OS = new HashSet<String>();
				Set<String> set_speakers = new HashSet<String>();
				Set<String> set_netadapt = new HashSet<String>();
				Set<String> set_scrnres = new HashSet<String>();
				Set<String> set_chipset = new HashSet<String>();
				Set<String> set_ram = new HashSet<String>();
				Set<String> set_ramType = new HashSet<String>();
				Set<String> set_pcs = new HashSet<String>();
				Set<String> set_cores = new HashSet<String>();
				Set<String> set_graphcard = new HashSet<String>();
				
				
				Statement s = myConnection.createStatement();
				String query = "SELECT * FROM laptops";
				ResultSet rs = s.executeQuery(query);
				
				while(rs.next()){ 
					if(!(rs.getString(4) == null))
						set_manf.add(rs.getString(4));
					if(!(rs.getString(6) == null))
						set_OS.add(rs.getString(6));
					if(!(rs.getString(7) == null))
						set_speakers.add(rs.getString(7));
					if(!(rs.getString(8) == null))
						set_netadapt.add(rs.getString(8));
					if(!(rs.getString(13) == null))
						set_scrnres.add(rs.getString(13));
					if(!(rs.getString(9) == null))
						set_chipset.add(rs.getString(9));
				}
				
				query = "SELECT size,type FROM ram";
				rs = s.executeQuery(query);
				while(rs.next()){ 
					if(!(rs.getString(1) == null))
						set_ram.add(rs.getString(1));	
					if(!(rs.getString(2) == null))
						set_ramType.add(rs.getString(2));
				}
				
				query = "SELECT clock_speed,cores FROM processor";
				rs = s.executeQuery(query);
				while(rs.next()){
					if(!(rs.getString(1) == null)) 
						set_pcs.add(rs.getString(1));
					if(!(rs.getString(2) == null))
						set_cores.add(rs.getString(2));
				}
				
				query = "SELECT manf FROM graphics_card";
				rs = s.executeQuery(query);
				while(rs.next()){ 
					if(!(rs.getString(1) == null))
						set_graphcard.add(rs.getString(1));
				}
					
				
		%>
    
		<h1>Search for Laptops</h1>
		<div class="container">
		<form class="form-signin-heading" name="laptopSearch" method="post" action="searchResults.jsp?type=laptop">
			
				<input class="form-control" type="text" name="CostMin" placeholder="Mimimum cost"  autofocus/>
				<input class="form-control"  type="text" name="CostMax" placeholder="Maximum cost"/>
				
				<select name="Manufacturer" class="form-control" placeholder="Brand">
				<option value = ""> Select Brand </option>
			<%
				
				for(String temp : set_manf){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_manf.clear();
			%>
				</select>
				
				<select name="OS" class="form-control">
				<option value = ""> Select OS </option>
			<%
				for(String temp : set_OS){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_OS.clear();
			%>
				</select>

				<select name="Speakers" class="form-control">
				<option value = ""> Select Speakers </option>
			<%
				for(String temp : set_speakers){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_speakers.clear();
			%>
				</select>

				<select name="NetworkAdaptor" class="form-control">
				<option value = ""> Select Network Adaptor </option>
			<%
				for(String temp : set_netadapt){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_netadapt.clear();
			%>
				</select>

				<select name="Chipset" class="form-control">
				<option value = ""> Select Chipset </option>
			<%
				for(String temp : set_chipset){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_chipset.clear();
			%>
				</select>

				<input class="form-control"  type="text" name="Battery" placeholder="Battery"/>
				<input class="form-control"  type="text" name="ScreenSizeMin" placeholder="Minimum Screen Size"/>

				<input class="form-control"  type="text" name="ScreenSizeMax" placeholder="Maximum Screen Size"/>

				<select name="ScreenResolution" class="form-control">
				<option value = ""> Select Screen Resolution </option>
			<%
				for(String temp : set_scrnres){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_scrnres.clear();
			%>
				</select>
				<input class="form-control"  type="text" name="HardDiskMin" placeholder="Minimum HDD capacity"/>
				<input class="form-control"  type="text" name="HardDiskMax" placeholder="Maximum HDD capacity"/>

				<select name="RamSize" class="form-control">
				<option value = ""> Select RAM size </option>
			<%
				for(String temp : set_ram){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_ram.clear();
			%>
				</select>

				<select name="RamType" class="form-control">
				<option value = ""> Select RAM Type </option>
			<%
				for(String temp : set_ramType){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_ramType.clear();
			%>
				</select>

				<select name="ProcessorSpeed" class="form-control">
				<option value = ""> Select Processor speed </option>
			<%
				for(String temp : set_pcs){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_pcs.clear();
			%>
				</select>

				<select name="Cores" class="form-control">
				<option value = ""> Select Number of cores </option>
			<%
				for(String temp : set_cores){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_cores.clear();
			%>
				</select>

				<select name="GraphicsCard" class="form-control">
				<option value = ""> Select Graphic card brand </option>
			<%
				for(String temp : set_graphcard){
			%>
				<option> <%= temp.trim() %> </option>
			<% 	
				}
				set_graphcard.clear();
			%>
				</select>
			<button class="btn btn-lg btn-primary btn-block" type="SUBMIT" name="SUBMIT" value="SUBMIT">Search</button>
			
		<%
				myConnection.close();

			}
			catch(ClassNotFoundException e){out.print(e.getMessage());}
			catch (SQLException ex)
			{
				out.print("SQLException: "+ex.getMessage());
				out.print("SQLState: " + ex.getSQLState());
				out.print("VendorError: " + ex.getErrorCode());
			}
			catch(Exception e){out.print(e.getMessage());}
		%>
		</form>
		</div>
	</body>
</html>
