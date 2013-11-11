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
            <li class="active"><a href="searchlaptops.jsp">Laptops</a></li>
            <li><a href="searchmobiles.jsp">Mobiles</a></li>
            <li><a href="searchtablets.jsp">Tablets</a></li>            
          </ul>
        </div>
      </div>
    </div>
    
    
    
		<h1>Search for Laptops</h1>
		<div class="container">
		<form class="form-signin-heading" name="laptopSearch" method="post" action="searchResults.jsp?type=laptop">
			
				<input class="form-control" type="text" name="CostMin" placeholder="Mimimum cost"  autofocus/>
				<input class="form-control"  type="text" name="CostMax" placeholder="Maximum cost"/>
				<input class="form-control"  type="text" name="Manufacturer" placeholder="Manufacturer"/>
				<input class="form-control"  type="text" name="OS" placeholder="OS"/>
				<input class="form-control"  type="text" name="Speakers" placeholder="Speakers"/>
				<input class="form-control"  type="text" name="NetworkAdaptor" placeholder="Network Adaptor"/>
				<input class="form-control"  type="text" name="Chipset" placeholder="Chipset"/>
				<input class="form-control"  type="text" name="Battery" placeholder="Battery"/>
				<input class="form-control"  type="text" name="ScreenSizeMin" placeholder="Minimum Screen Size"/>
				<input class="form-control"  type="text" name="ScreenSizeMax" placeholder="Maximum Screen Size"/>
				<input class="form-control"  type="text" name="ScreenResolution" placeholder="Screen Resolution"/>
				<input class="form-control"  type="text" name="HardDiskMin" placeholder="Minimum HDD capacity"/>
				<input class="form-control"  type="text" name="HardDiskMax" placeholder="Maximum HDD capacity"/>
				<input class="form-control"  type="text" name="RamSize" placeholder="RAM"/>
				<input class="form-control"  type="text" name="RamType" placeholder="RAM Type"/>
				<input class="form-control"  type="text" name="ProcessorSpeed" placeholder="Processor Clock Speed"/>
				<input class="form-control"  type="text" name="Cores" placeholder="Cores"/>
				<input class="form-control"  type="text" name="GraphicsCard" placeholder="Graphics Card"/>
			
			<button class="btn btn-lg btn-primary btn-block" type="SUBMIT" name="SUBMIT" value="SUBMIT">Search</button>
		</form>
		</div>
	</body>
</html>
