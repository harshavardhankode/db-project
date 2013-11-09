<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>

<html>
	<head>
		<title> Add a laptop </title>
	</head>
	<body>
		<%!
		public String convert_string(String s){
			String t = "";
			if (s.equals("")) t = "null";
			else t = "'" + s + "'";
			return t;		
		} 
		
		public String convert_string_int(String s){
			String t ="";
			if (s.equals("")) t = "null";
			else t = s;
			return t;		
		} 
		
		%>
		<%
			
				
			try 
			{
				String driver = "org.postgresql.Driver";
				String url = "jdbc:postgresql://localhost:5432/nishant";
				String username = "nishant"; // Enter your PostgreSQL username
				String password = "newpassword"; // Enter your PostgreSQL password
				Connection myConnection = null;
				Class.forName(driver).newInstance();
				
				
				
				if (session.getAttribute("permission").equals("admin")){
					myConnection = DriverManager.getConnection(url,username,password);	
	
					Statement s = myConnection.createStatement();
				
					
					String manf_in = convert_string(request.getParameter("manf"));
					String pname_in = convert_string(request.getParameter("pname"));
					String cost_in = convert_string_int(request.getParameter("cost"));	
					String weight_in = convert_string_int(request.getParameter("weight"));
					String os_in = convert_string(request.getParameter("os"));	
					String hard_disk_in = convert_string(request.getParameter("hard_disk"));	
					String s_size_in = convert_string(request.getParameter("s_size"));	
					String s_resol_in = convert_string(request.getParameter("s_resol"));	
					String speakers_in = convert_string(request.getParameter("speakers"));		
					String battery_in = convert_string(request.getParameter("battery"));		
					String wifi_in = convert_string(request.getParameter("wifi"));	
					String chipset_in = convert_string(request.getParameter("chipset"));		
				
					String ram_size_in = convert_string(request.getParameter("ram_size"));	
					String ram_type_in = convert_string(request.getParameter("ram_type"));	
				
					String p_manf_in = convert_string(request.getParameter("p_manf"));		
					String p_pname_in = convert_string(request.getParameter("p_pname"));	
					String cores_in = convert_string(request.getParameter("cores"));	
					String clock_speed_in = convert_string(request.getParameter("clock_speed"));	
				
					String g_manf_in = convert_string(request.getParameter("g_manf"));
					String g_pname_in = convert_string(request.getParameter("g_pname"));		
					String g_mem_in = convert_string(request.getParameter("g_mem"));	
					String g_type_in = convert_string(request.getParameter("g_type"));
					
					String ram_id;
					String proc_id;
					String g_id;
					
							
					String query = "SELECT id  FROM ram WHERE size = " + ram_size_in + " and type = " + ram_type_in + ";";
					ResultSet rs = s.executeQuery(query);
					if (rs.next()){
						ram_id = rs.getString(1);
					}
					else{
						query = "INSERT INTO ram(size, type) VALUES(" + ram_size_in + "," + ram_type_in + ");";
						s.executeUpdate(query);
						query = "SELECT max(id) FROM ram;";
						rs = s.executeQuery(query);
						rs.next();
						ram_id = rs.getString(1);
					}
					out.println("<h2>"+ ram_id + "</h2>");
					
					query = "SELECT id  FROM processor WHERE manf = " + p_manf_in + " and pname = " + p_pname_in + " and cores = " + cores_in + " and clock_speed = " + clock_speed_in + ";";
					rs = s.executeQuery(query);
					if (rs.next()){
						proc_id = rs.getString(1);
					}
					else{
						query = "INSERT INTO processor(manf, pname, cores, clock_speed) VALUES(" + p_manf_in + "," + p_pname_in + "," + cores_in + "," + clock_speed_in + ");";
						s.executeUpdate(query);
						query = "SELECT max(id) FROM processor;";
						rs = s.executeQuery(query);
						rs.next();
						proc_id = rs.getString(1);
					}
					out.println("<h2>"+ proc_id + "</h2>");
					
					query = "SELECT id  FROM graphics_card WHERE manf = " + g_manf_in + "and pname = " + g_pname_in + " and memory = " + g_mem_in + " and type = " + g_type_in +";";
					rs = s.executeQuery(query);
					if (rs.next()){
						g_id = rs.getString(1);
					}
					else{
						query = "INSERT INTO graphics_card(manf,pname, memory, type) VALUES(" + g_manf_in + "," + g_pname_in + "," + g_mem_in + "," + g_type_in + ");";
						s.executeUpdate(query);
						query = "SELECT max(id) FROM graphics_card;";
						rs = s.executeQuery(query);
						rs.next();
						g_id = rs.getString(1);
						
					}
					out.println("<h2>"+ g_id + "</h2>");

					query = "INSERT INTO Laptops(cost, weight, manf, pname, os, speakers, network_adaptor, chipset, battery, screen_size, hard_disk, screen_resolution, ram_id, proc_id, gcard_id) VALUES(" + cost_in + "," + weight_in + "," + manf_in + "," + pname_in + "," + os_in + "," + speakers_in + "," + wifi_in + "," + chipset_in + "," + battery_in + "," + s_size_in + "," + hard_disk_in + "," + s_resol_in + "," + ram_id + "," + proc_id + "," + g_id + ");";
					s.executeUpdate(query);
					myConnection.close();
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
