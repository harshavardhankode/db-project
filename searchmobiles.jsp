<html>
	<head>
		<title>Mobile Search Page</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<h1>Search for Mobiles</h1>
		<div class="search">
		<form name="mobileSearch" method="post" action="searchresults.jsp">
			<ul>
				<li>Cost: <input type="text" name="CostMin"/> to <input type="text" name="CostMax"/></li>
				<li>Manufacturer: <input type="text" name="Manufacturer"/></li>
				<li>OS: <input type="text" name="OS"/></li>
				<li>InternalMemory: <input type="text" name="InternalMemory"/></li>
				<li>ScreenType: <input type="text" name="ScreenType"/></li>
				<li>Sim: <input type="text" name="Sim"/></li>
				<li>Battery: <input type="text" name="Battery"/></li>
				<li>ScreenSize: <input type="text" name="ScreenSizeMin"/> to <input type="text" name="ScreenSizeMax"/></li>
				<li>RamSize: <input type="text" name="RamSizeMin"/> to <input type="text" name="RamSizeMax"/></li>
				<li>RamSpeed: <input type="text" name="RamSpeed"/></li>
				<li>RamType: <input type="text" name="RamType"/></li>
				<li>ScreenResolution: <input type="text" name="ScreenResolution"/></li>
				<li>Processor: <input type="text" name="Processor"/></li>
				<li>Cores: <input type="text" name="Cores"/></li>
				<li>GraphicsCard: <input type="text" name="GraphicsCard"/></li>	
			</ul>
			<input id="submit" type="SUBMIT" name="SUBMIT" value="SUBMIT"/>
		</form>
		</div>
	</body>
</html>
