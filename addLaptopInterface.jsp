<html>
<head>
 <title>Add a laptop</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <style type="text/css">
   <%@ include file="dist/css/bootstrap.min.css" %>
   <%@ include file="dist/signin.css" %>
  </style>
</head>

<body>
 <div class="container">
  <form name="loginForm" method="post" action="addLaptop.jsp" class="form-signin">
   <h2 class="form-signin-heading">Adding a laptop</h2>
   	<input type="text" name="manf" class="form-control" placeholder="Manufacturer"  autofocus required>
    <input type="text" name="pname" class="form-control" placeholder="Product Name" required>
    <input type="text" name="cost" class="form-control" placeholder="Cost" >
    <input type="text" name="weight" class="form-control" placeholder="Weight" >
    <input type="text" name="OS" class="form-control" placeholder="Operating System" >
    <input type="text" name="hard_disk" class="form-control" placeholder="Hard Disk Capacity" >
    <input type="text" name="s_size" class="form-control" placeholder="Screen Size" >
    <input type="text" name="s_resol" class="form-control" placeholder="Screen Resolution" >
    <input type="text" name="speakers" class="form-control" placeholder="Speakers" >
    <input type="text" name="battery" class="form-control" placeholder="Battery" >
    <input type="text" name="wifi" class="form-control" placeholder="Wi-Fi Adapter" >
    <input type="text" name="chipset" class="form-control" placeholder="Chipset" >
    <br><p>RAM</p></br>
    <input type="text" name="ram_size" class="form-control" placeholder="Memory in GB" >
    <input type="text" name="ram_type" class="form-control" placeholder="RAM Type" >
    <br><p>Processor</p><br>
    <input type="text" name="p_manf" class="form-control" placeholder="Manufacturer" required>
    <input type="text" name="p_pname" class="form-control" placeholder="Name" required>
    <input type="text" name="cores" class="form-control" placeholder="Number of cores" >
    <input type="text" name="clock_speed" class="form-control" placeholder="Clock Speed" >
    <br><p>Graphics Card</p><br>
    <input type="text" name="g_manf" class="form-control" placeholder="Manufacturer" required>
    <input type="text" name="g_pname" class="form-control" placeholder="Card Name" requiredgedit signup.js>
    <input type="text" name="g_mem" class="form-control" placeholder="Memory in GB" >
    <input type="text" name="g_type" class="form-control" placeholder="Type of memory" >
    <br>
    <!-- Need to add checks, like if cost is integer or not -->
    
   <button class="btn btn-lg btn-primary btn-block" type="Submit" name="Submit" value="Add">Add</button>
  </form>
 </div>
       
</body>
</html>
