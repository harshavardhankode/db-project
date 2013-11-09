<html>
	<head>
		<title>Laptop Search Page</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<h1>Search for Laptops</h1>
		<div class="search">
		<form name="laptopSearch" method="post" action="searchresults.jsp">
			<ul>
				<li>Cost: <input type="text" name="CostMin"/> to <input type="text" name="CostMax"/></li>
				<li>Manufacturer: <input type="text" name="Manufacturer"/></li>
				<li>OS: <input type="text" name="OS"/></li>
				<li>Speakers: <input type="text" name="Speakers"/></li>
				<li>NetworkAdapter: <input type="text" name="NetworkAdapter"/></li>
				<li>Chipset: <input type="text" name="Chipset"/></li>
				<li>Battery: <input type="text" name="Battery"/></li>
				<li>ScreenSize: <input type="text" name="ScreenSizeMin"/> to <input type="text" name="ScreenSizeMax"/></li>
				<li>HardDisk: <input type="text" name="HardDisk"/>
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
