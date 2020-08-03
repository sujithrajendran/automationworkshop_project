
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
    <%@ page import="suji.util.DBconnection" %> 
    <%@ page import="java.sql.Connection" %>  
    <%@ page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession"%>
 
  

<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Mechnanic</title>
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
</script>
</head>
<body onload="checkcookie()">
<% String id="";
   String mobilenumber="";
   String firstname="";
   String sid="";
   String shop="";
   String mechanic="";
   String shopid="";
   String mechanicid="";
   String Phonenumber="";
   
   
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
				
<% session.setAttribute("details","deletemechanic"); %>
<form action="DeleteMechanic.jsp" method="post">
<header id="header">
			<div id="logo">
				<h1>Vehicle Repair Shop</h1>	
				<h3><font color="white"> NAME: <%= firstname.toUpperCase() %>
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
					<li><a href="DeleteMechanic.jsp">Remove Mechanic</a></li>
				
				</ul>
			</div>
</nav>
<main>

<div class="tube">
<div class="form-style-2">
<div class="form-style-2-heading">Delete Mechanic Details</h2></div>

<% 

if(con!=null)
{
try 
{	
		Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select shopname,shopid from shopdetails where dealerid='"+id+"' order by shopid,shopname");
	%>
	<tr><td><label><span>Shop name:<font color="red" size="2">*</font></span><select name="Shopid" id="shopid" class="select-field" onchange ="this.form.submit()" >
	<option>Select the Shop Name</option>
  	<%  while(rs.next()) { %>
    <option <%= request.getParameter("Shopid")!=null? request.getParameter("Shopid").equals(rs.getString(1)+"-"+rs.getString(2))? "selected":"":"" %>><%= rs.getString(1)+"-"+rs.getString(2)%></option>
  <% }
}
 catch(Exception e)
 {	System.out.println(e.toString()); }}
  %> </select> </label>
  
  
<%if(request.getParameter("Shopid") != null)
{
	shop=request.getParameter("Shopid");
shopid=request.getParameter("Shopid").split("-")[1];
sid=shopid;
}
System.out.println("Shopid =" +shopid); %>

<%
if(con!=null)
{
try 
{	
		Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select mechanicname,mechanicid from mechanicdetails where shopid='"+shopid+"' order by mechanicid,mechanicname");
	%>
	<tr><td><label><span>Mechanic Id:<font color="red" size="2">*</font></span><select name="MechanicId" id="mechanicid" class="select-field" >
	<option>Select the Mechanic Name</option>
  	<%  while(rs.next()) { %>
    <option <%= request.getParameter("MechanicId")!=null? request.getParameter("MechanicId").equals(rs.getString(1)+"-"+rs.getString(2))? "selected":"":"" %>><%= rs.getString(1)+"-"+rs.getString(2)%></option>
  <% System.out.println("mname ="+rs.getString(1)+"- mid ="+rs.getString(2));
  }
  	mechanic = request.getParameter("MechanicId");
  	System.out.println("select mid =" +request.getParameter("MechanicId"));
}
 catch(Exception e)
 {	System.out.println(e.toString()); }}  %>
 
</select> </label>
<div class="button"><input type="submit" onclick="form.action='DealerServlet'" value="Delete" />
<input type="button" onclick="window.location.href='WelcomeDealer.jsp'" value="Cancel"/></label></div>
</div>
</main>
</body>
</html>