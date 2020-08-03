<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
    <%@ page import="suji.util.DBconnection" %> 
    <%@ page import="java.sql.Connection" %>  
    <%@ page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession"%>
     <%@page import="java.text.SimpleDateFormat" %>
    <%@page import=" java.text.ParseException" %>

<html>
<head>

 
<meta charset="ISO-8859-1">
<title>Raise Query</title>
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
   String faultid="";
   String customerid="";
   String pincode="";
   String Vehicle="";
   String shopid="";
   String sid="";
   String mid="";
   String mechanicid="";
   String mname="";
   String mecid="";
   int j=0;
   String malert="No";
   String mechanicalert[]= new String[10000];
   
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
			
<% session.setAttribute("customer","raisequery"); %>
<form action="RaiseQuery.jsp" method="post">
<main>
<% session.setAttribute("customerid",id);
System.out.println("set attribute id -"+id); %>

<div class="tube">
<div class="form-style-2">
<div class="form-style-2-heading">Register Vehicle Query</h2></div>

<tr><td><label><span>Vehicle type<font color="red" size="2">*</font></span>
<select name="Vehicle" id="vehicle" class="select-field">
<option>Select-VehicleType</option>
<option value="Bike" <%= request.getParameter("Vehicle")!=null? request.getParameter("Vehicle").equals("Bike")? "selected":"":"" %> >Bike</option>
<option value="Car" <%= request.getParameter("Vehicle")!=null? request.getParameter("Vehicle").equals("Car")? "selected":"":"" %> >Car</option></option></select></label>

<label><span>Company Name: <font color="red">*</font></span>
<input type="text" class="input-field"  name="CompanyName" id="companyname" value='<%=request.getParameter("CompanyName") != null ? request.getParameter("CompanyName") : ""%>' required autofocus/></label>

<label><span>Model: <font color="red">*</font></span>
<input type="text" class="input-field"  name="VehicleModel" id="vehiclemodel"  value='<%=request.getParameter("VehicleModel") != null ? request.getParameter("VehicleModel") : ""%>'required autofocus/></label>

<label><span>Registration Number: <font color="red">*</font></span>
<input type="text" class="input-field"  name="VehicleNumber" id="vehiclenumber" value='<%=request.getParameter("VehicleNumber") != null ? request.getParameter("VehicleNumber") : ""%>' /></label>

<label><span>Fault Vehicle Area: <font color="red">*</font></span>
<input type="text" class="input-field"  name="City" id="city" value='<%=request.getParameter("City") != null ? request.getParameter("City") : ""%>' required autofocus/></label>

<label><span>Pincode <font color="red">*</font></span>
<input type="text" class="input-field"  name="Pincode" id="pincode" value='<%=request.getParameter("Pincode") != null ? request.getParameter("Pincode") : ""%>' required autofocus onchange ="this.form.submit()"/></label>
<% 
pincode=request.getParameter("Pincode");
Vehicle=request.getParameter("Vehicle");
System.out.println("Pincode -"+pincode);
System.out.println("Vehicle -"+Vehicle);
if(con!=null)
{
try 
{	
		Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select shopname,shopid from shopdetails where pincode='"+pincode+"' and (repairvehicletype='"+Vehicle+"' or repairvehicletype='ALLVehicle') order by shopid,shopname");
	%>
	<tr><td><label><span>Select Repair Shop:<font color="red" size="2">*</font></span><select name="Shopid" id="shopid" class="select-field" onchange ="this.form.submit()">
	<option>Select-ShopName</option>
  	<%  while(rs.next()) { %>
    <option <%= request.getParameter("Shopid")!=null? request.getParameter("Shopid").equals(rs.getString(1)+"-"+rs.getString(2))? "selected":"":"" %>><%= rs.getString(1)+"-"+rs.getString(2)%></option>
  <% }
}
 catch(Exception e)
 {	System.out.println(e.toString()); }}
  %> </select> </label>


<% if(request.getParameter("Shopid") != null && 
request.getParameter("Pincode") !=null)
{
	sid=request.getParameter("Shopid");
shopid=request.getParameter("Shopid").split("-")[1];

}
System.out.println("Shopid =" +shopid); %>



<% if(con!=null)
{
try 
{	
		Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select mechanicname,mechanicid from mechanicdetails where shopid='"+shopid+"' order by mechanicid,mechanicname");
	%>
	<tr><td><label><span>Select Mechanic<font color="red" size="2">*</font></span><select name="MechanicId" id="mechanicid" class="select-field" onchange ="this.form.submit()">
	<option>Select-MechanicName</option>
  	<%  while(rs.next()) { 
  	mname=rs.getString(1);
  	mecid=rs.getString(2);%>
    <option <%= request.getParameter("MechanicId")!=null? request.getParameter("MechanicId").equals(mname+"-"+mecid)? "selected":"":"" %>><%=mname+"-"+mecid%></option>
  <% }
}
 catch(Exception e)
 {	System.out.println(e.toString()); }}
  %> 
  </select> </label>

<% if(request.getParameter("MechanicId") != null && 
request.getParameter("Pincode") !=null &&
request.getParameter("Shopid") != null)
{
	mid=request.getParameter("MechanicId").split("-")[1];

}
System.out.println("mid =" +mid); %>

<% 
Connection con1=DBconnection.getDBConnection(); %>
<% if(con1!=null)
{
	try
	{
	Statement st2 = con1.createStatement();
    ResultSet rs2=st2.executeQuery("select mechanicid from ticketquery where ticketstatus='In-Progress'");
    while(rs2.next()) 
    { 
    	mechanicid=rs2.getString(1);
    	mechanicalert[j]=mechanicid;
        j++;
    }
} 
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
}

for(int m=0;m<j;m++)
{ 
	System.out.println("mechanicid =" +mechanicalert[m]);
	if(mid.equalsIgnoreCase(mechanicalert[m]))
    {
   	 malert="yes";
   	 mname="";
   	 mid="";
    }
}
System.out.println("malert =" +malert);%>

<%if(malert.equalsIgnoreCase("yes"))
 {
 %>
   <script type="text/javascript" language="javascript">
				alert('Select Different Mechanic !! He is already assigned for some vehicle')
			</script>
 <%} %>
<label><span>Fault <font color="red">*</font></span>
<input type="text" id="fault"  class="input-field"  name="Fault"  style=" height: 80px; width:406px; margin-bottom:20px;" required autofocus/></lable>

</td></td></td></td></tr></table>

<div class="button"><input type="submit" onclick="form.action='CustomerServlet'" value="Save" />
<input type="button" onclick="window.location.href='WelcomeCustomer.jsp'" value="Cancel"/></label></div>
</div>
</div>
</form>
</main>
<nav id="nav">
			<div class="innertube">
				<h2>Customer</h2>
				<ul>
				    <li><a href="WelcomeCustomer.jsp">Home</a></li>	
					<li><a href="RaiseQuery.jsp">Raise Query</a></li>				
				</ul>
			</div>
		</nav>
</body>
</html>