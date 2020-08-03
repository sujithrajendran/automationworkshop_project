
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
<title>Administrator</title>
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
    ResultSet rs=st.executeQuery("select mobilenumber,firstname from details where id='"+id+"'");
    while(rs.next()) 
    { 
    	mobilenumber=rs.getString(1);
    	firstname=rs.getString(2);
    }
} 
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
} %>
			
			
<% session.setAttribute("vehicle","status"); %>
<form action="RegisterMachanic.jsp" method="post">
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
<% session.setAttribute("details","machanic"); %>
<form action="RegisterMachanic.jsp" method="post">
	<nav id="nav">
			<div class="innertube">
				<h2>Dealer</h2>
				<ul>
					<li><a href="WelcomeDealer.jsp">Home</a></li>
					<li><a href="RegisterMachanic.jsp">Register Mechanic</a></li>
				
				</ul>
			</div>
</nav>
<main>

<div class="tube">
<div class="form-style-2">
<div class="form-style-2-heading">Register Mechanic Details</h2></div>

<% 

if(con!=null)
{
try 
{	
		Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select shopname,shopid from shopdetails where dealerid='"+id+"' order by shopid,shopname");
	%>
	<tr><td><label><span>Shop name:<font color="red" size="2">*</font></span><select name="Shopid" id="shopid" class="select-field">
	<option>Select the Shop Name</option>
  	<%  while(rs.next()) { %>
    <option <%= request.getParameter("Shopid")!=null? request.getParameter("Shopid").equals(rs.getString(1)+"-"+rs.getString(2))? "selected":"":"" %>><%= rs.getString(1)+"-"+rs.getString(2)%></option>
  <% }
}
 catch(Exception e)
 {	System.out.println(e.toString()); }}
  %> </select> </label>
  
<label><span>MechanicName: <font color="red">*</font></span>
<input type="text" class="input-field"  name="MechanicName" id="mechanicname" onKeyup="capitalize(this)" required autofocus/></label>

<label><span>PhoneNumber <font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="PhoneNumber" id="phonenumber" required autofocus/></label>

<label><span>MailId <font color="red">*</font></span>
<input type="text" class="input-field" name="MailId" id="mailid" required autofocus/></label>

<label><span>Age<font color="red">*</font></span>
<input type="number" class="input-field" name="Age" id="age" required autofocus/></label>
<label><span>Address<font color="red">*</font></span>
<input type="text" class="input-field" name="Address" id="address" onKeyup="capitalize(this)" required autofocus/></label>
<label><span>Pincode<font color="red">*</font></span>
<input type="text" class="input-field" name="Pincode" id="pincode" required autofocus/></label>
<label><span>State<font color="red">*</font></span>
<input type="text" class="input-field" name="State" id="state" onKeyup="capitalize(this)" required autofocus/></label>

<div class="button"><input type="submit" onclick="form.action='DealerServlet'" value="Save" />
<input type="button" onclick="window.location.href='WelcomeDealer.jsp'" value="Cancel"/></label></div>
</div>
</main>
</body>
</html>