
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
    <%@ page import="suji.util.DBconnection" %> 
    <%@ page import="java.sql.Connection" %>  
    <%@ page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession"%>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import=" java.text.ParseException" %>

<html>
<head> 
<meta charset="ISO-8859-1">
<title>Register Shop</title>
<link rel="stylesheet" type="text/css" href="mainstyle.css">
<script type="text/javascript">
	function checkcookie() 
	{
		var refreshadminpage= getCookie("refreshadmin");
		if(refreshadminpage == null)
			{
			window.location.reload(true);
			document.cookie="refreshadmin=sampleadmin"
			}
		
	}
	function capitalize(el) 
	{
	    var s = el.value;
	    el.value = s.substring(0,1).toUpperCase() + s.substring(1);
	}
</script>
</head>
<body onload="checkcookie()">
<% String id="";
   String mobilenumber="";
   String firstname="";
   String dealerid="";
   
			Cookie[] cc = request.getCookies();
			for(int i=0;i<cc.length;i++)
			{
				if(cc[i].getName().equals("id"))
				{
				 id=cc[i].getValue(); 
			    }
			}
			System.out.println("id -"+id);
			%>
			
<% 
Connection con=DBconnection.getDBConnection(); %>
<% if(con!=null)
{
	try
	{
	Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select mobilenumber,firstname,id from details where id='"+id+"'");
    while(rs.next()) 
    { 
    	mobilenumber=rs.getString(1);
    	firstname=rs.getString(2);
    	dealerid=rs.getString(3);
    }
} 
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
	System.out.println("mobilenumber-"+mobilenumber+" name-"+firstname+" dealerid-"+dealerid);
} %>
			
			
<% session.setAttribute("details","registershop"); %>
<form action="RegisterShop.jsp" method="post">
<header id="header">
			<div id="logo">
				<h1>Vehicle Repair Shop</h1>	
				<h3><font color="white">NAME: <%= firstname.toUpperCase() %>
				</font></h3>

		
			<label class="logoutLblPos">
			<img src="logout.png" onclick="window.location.href='register.jsp'" height="60%" width="60%" id="img">
  </label>
			</div>
</header>
<nav id="nav">
			<div class="innertube">
				<h2>Dealer</h2>
				<ul>
					<li><a href="WelcomeDealer.jsp">Home</a></li>
					<li><a href="RegisterShop.jsp">Register Shop</a></li>
				
				</ul>
			</div>
</nav>
<main>

<% session.setAttribute("dealerid",dealerid);
System.out.println("set attribute id -"+dealerid); %>


<div class="tube">
<div class="form-style-2" >
<div class="form-style-2-heading">Register Shop Details</h2></div>

<label><span>Shop Name <font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="ShopName" id="shopname" onKeyup="capitalize(this)" required autofocus/></label>

<label><span>Owner Name <font color="red">*</font></span>
<input type="text" class="input-field" name="OwnerName" id="ownername" onKeyup="capitalize(this)" required autofocus/></label>

<label><span>Shop Address <font color="red">*</font></span>
<input type="text" class="input-field" name="ShopAddress" id="shopaddress" onKeyup="capitalize(this)" required autofocus/></label>

<label><span>Area <font color="red">*</font></span>
<input type="text" class="input-field"  name="Area" id="area" onKeyup="capitalize(this)" required autofocus/></label>

<label><span>City <font color="red">*</font></span>
<input type="text" class="input-field"  name="City" id="city"  onKeyup="capitalize(this)"required autofocus/></label>

<label><span>State <font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="State" id="state"  onKeyup="capitalize(this)"required autofocus/></label>

<label><span>Pincode <font color="red">*</font></span>
<input type="number" class="input-field"  name="Pincode" id="pincode" required autofocus/></label>

<label><span>Shop Mail id <font color="red">*</font></span>
<input type="text" class="input-field" name="ShopEmailId" id="shopemailid"  required autofocus/></label>

<label><span >Shop contact Number <font color="red">*</font></span>
<input type="number" class="input-field" name="ShopContactNumber" id="shopcontactnumber" required autofocus/></label>

<tr><td><label><span>Vehicle type<font color="red" size="2">*</font></span>
<select name="vehicle" id="vehicle" class="select-field">
<option>Select Vehicle Type</option>
<option value="Bike">Bike</option>
<option value="Car">Car</option>
<option value="ALLVehicle">All - Vehicles</option></select></label>


<div class="button"><input type="submit"  onclick="form.action='DealerServlet'" value="Save" />
<input type="button" onclick="window.location.href='WelcomeDealer.jsp'" value="Cancel"/></label></div>
</div>
</div>

</main>
</body>
</html>