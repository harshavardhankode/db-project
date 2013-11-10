<html>
	<head>
		<title>Tablet Search Page</title>
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
            <li class="active"><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="login.jsp">Log In</a></li>
            <li><a href="#signup" >Sign Up</a></li>            
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
            <li class="active"><a href="searchtablets.jsp">Tablets</a></li>            
          </ul>
        </div>
      </div>
    </div>
    
    
    
		<h1>Search for Tablets</h1>
		<div class="container">
		<form class="form-signin-heading" name="laptopSearch" method="post" action="searchResults.jsp?type=tablet">
			
				<input class="form-control" type="text" name="CostMin" placeholder="Mimimum cost"  autofocus/>
				<input class="form-control"  type="text" name="CostMax" placeholder="Maximum cost"/>
				<input class="form-control"  type="text" name="Manufacturer" placeholder="Manufacturer"/>
				<input class="form-control"  type="text" name="OS" placeholder="OS"/>
				<input class="form-control" type="text" name="InternalMemory" placeholder="Interal Memory"/>
				<input class="form-control" type="text" name="ScreenType" placeholder="Screen Type"/>
				<input class="form-control" type="text" name="3G" placeholder="3G"/>
				<input class="form-control" type="text" name="Wifi" placeholder="Wifi"/>
				<input class="form-control" type="text" name="Battery" placeholder="Battery"/>
				<input class="form-control"  type="text" name="ScreenSizeMin" placeholder="Minimum Screen Size"/>
				<input class="form-control"  type="text" name="ScreenSizeMax" placeholder="Maximum Screen Size"/>
				<input class="form-control"  type="text" name="ScreenResolution" placeholder="Screen Resolution"/>
				<input class="form-control"  type="text" name="RamSize" placeholder="RAM"/>
				<input class="form-control"  type="text" name="RamType" placeholder="RAM Type"/>
				<input class="form-control"  type="text" name="ProcessorSpeed" placeholder="Processor Clock Speed"/>
				<input class="form-control"  type="text" name="Cores" placeholder="Cores"/>
				<input class="form-control"  type="text" name="GraphicsCard" placeholder="Graphics Card"/>
			</ul>
			<button class="btn btn-lg btn-primary btn-block" type="SUBMIT" name="SUBMIT" value="SUBMIT">Search</button>
		</form>
		</div>
	</body>
</html>
