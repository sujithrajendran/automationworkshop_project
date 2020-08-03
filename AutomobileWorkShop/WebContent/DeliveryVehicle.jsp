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
<title>Delivery Ticket</title>
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
	function upperCaseF(a){
	    setTimeout(function(){
	        a.value = a.value.toUpperCase();
	    }, 1);
	}
	function capitalize(el) 
	{
	    var s = el.value;
	    el.value = s.substring(0,1).toUpperCase() + s.substring(1);
	}
	 
	 </script>
</head>
<body onload="checkcookie()">
 <% session.setAttribute("details","delivery"); %>
<form action="DeliveryVehicle.jsp" method="post">

<% String id="";
String customername="";
   String mobilenumber="";
   String firstname="";
   String ticketnumber="";
   String ownername="";
   String vehicletype="";
   String companyname="";
   String vehiclemodel="";
   String registernumber="";
   String area="";
   String pincode="";
   String mechanicname="";
   String fault="";
   String sparesreplaced="";
   String amount="";
   String shopid="";
   String mechanicid="";
   String ticketstatus="";
   String shopname="";
   String sid="";
   String mid="";
   int count=100;
   int dealercount=100;
   String status="";
   
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
			<% session.setAttribute("dealerid",id);
System.out.println("set attribute id -"+id); %>	




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
					<li><a href="DeliveryVehicle.jsp">Delivery Ticket</a></li>
				</ul>
			</div>
</nav>
<main>
<div class="tube">
<div class="form-style-2">
<div class="form-style-2-heading">Delivery Vehicler </h2></div>
<label><span>Ticket Number <font color="red">*</font></span>
<input type="text" class="input-field" name="TicketNumber" id="ticketnumber"   onKeyup="upperCaseF(this)" onchange ="this.form.submit()"  value='<%=request.getParameter("TicketNumber") != null ? request.getParameter("TicketNumber") : ""%>' required autofocus/></label>
<%if(request.getParameter("TicketNumber") != null)
{
	ticketnumber=request.getParameter("TicketNumber");
} 
 
if(con!=null)
{
if(request.getParameter("TicketNumber") != null)
{
try
{
	Statement stt = con.createStatement();
    ResultSet rs1=stt.executeQuery("select count(ticketnumber) from ticketquery where ticketnumber='"+ticketnumber+"'");
    while(rs1.next()) 
    { 
    	count=rs1.getInt(1);
    	System.out.println("Count--"+count );
    	
    }
}
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
}
}
if(con!=null)
{
if(request.getParameter("TicketNumber") != null)
	{
try
{
	Statement stt = con.createStatement();
    ResultSet rs1=stt.executeQuery(" select count(dealerid) from ticketquery where ticketnumber='"+ticketnumber+"' and dealerid='"+id+"'");
    while(rs1.next()) 
    { 
    	dealercount=rs1.getInt(1);
    	System.out.println("dealercount--"+dealercount );
    	
    	
    }
}
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
}
}
if(con!=null)
{

try
{
	Statement stt = con.createStatement();
    ResultSet rs1=stt.executeQuery("select ticketstatus from ticketquery where ticketnumber='"+ticketnumber+"'");
    while(rs1.next()) 
    { 
    	status=rs1.getString(1);
    	System.out.println("status--"+status );
    	
    	
    }
}
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
}


if(status.equalsIgnoreCase("Closed") || status.equalsIgnoreCase("Cancelled"))
{
%>
<script type="text/javascript" language="javascript">
		alert('Ticket Already Closed')
	</script>
<%} 


if(count==0 && request.getParameter("TicketNumber") != null)
		{
%>
			<script type="text/javascript" language="javascript">
		alert('Ticket not Exist')
	</script>
<%} 

else if(dealercount==0 && request.getParameter("TicketNumber") != null)
{
%>
			<script type="text/javascript" language="javascript">
		alert('Ticket not assigned to your Shop')
	</script>
<%} 
 %>
<% if(con!=null)
{
	try
	{
	Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select customername,vehicletype,companyname,vehiclemodel,registernumber,area,pincode,fault,shopid,mechanicid from ticketquery where ticketnumber='"+ticketnumber+"' and  dealerid='"+id+"' and ticketstatus='In-Progress'");
    while(rs.next()) 
    { 
    	
    	ownername=rs.getString(1);
    	vehicletype=rs.getString(2);
    	companyname=rs.getString(3);
    	vehiclemodel=rs.getString(4);
    	registernumber=rs.getString(5);
    	area=rs.getString(6);
    	pincode=rs.getString(7);
    	fault=rs.getString(8);
    	shopid=rs.getString(9);
    	mechanicid=rs.getString(10);
    }
} 
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
} 
if(con!=null)
{

try
{
	Statement st1 = con.createStatement();
    ResultSet rs1=st1.executeQuery("select shopname from shopdetails where shopid='"+shopid+"'");
    while(rs1.next()) 
    { 
    	shopname=rs1.getString(1);
    	System.out.println("shopname--"+shopname );

    }
}
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
} 
if(con!=null)
{

try
{
	Statement st2 = con.createStatement();
    ResultSet rs2=st2.executeQuery("select mechanicname from mechanicdetails where mechanicid='"+mechanicid+"'");
    while(rs2.next()) 
    { 
    	mechanicname=rs2.getString(1);
    	System.out.println("mechanicname--"+mechanicname );

    }
}
	catch(Exception e)
	 {
		System.out.println(e.toString()); 
	 }
}

sid=shopname+"-"+shopid;
mid=mechanicname+"-"+mechanicid;
%>
		

<label><span>Customer Name <font color="red">*</font></span>
<input type="text" class="input-field" name="CustomerName" id="customername" value="<%=ownername%>" required autofocus/></label>

<label><span>Vehicle Type <font color="red">*</font></span>
<input type="text" class="input-field" name="VehicleType" id="vehicletype" value="<%=vehicletype%>" required autofocus/></label>

<label><span>Company Name <font color="red">*</font></span>
<input type="text" class="input-field" name="CompanyName" id="companyname" value="<%=companyname%>" required autofocus/></label>

<label><span>Model <font color="red">*</font></span>
<input type="text" class="input-field" name="VehicleModel" id="vehiclemodel" value="<%=vehiclemodel%>" required autofocus/></label>

<label><span>Vehicle Number <font color="red">*</font></span>
<input type="text" class="input-field" name="RegisterNumber" id="registernumber" value="<%=registernumber%>" required autofocus/></label>

<label><span> Area<font color="red">*</font></span>
<input type="text" class="input-field"  name="Area" id="area" value="<%=area %>" required autofocus/></label>

<label><span>Pincode <font color="red">*</font></span>
<input type="number" class="input-field" name="Pincode" id="pincode" value="<%=pincode%>" required autofocus/></label>

<label><span>Shop Name <font color="red">*</font></span>
<input type="text" class="input-field" name="ShopName" id="shopname" value="<%=sid%>" required autofocus/></label>

<label><span>Mechanic Name <font color="red">*</font></span>
<input type="text" class="input-field" name="MechanicName" id="mechanicname" value="<%=mid%>" required autofocus/></label>

<label><span>Fault <font color="red">*</font></span>
<input type="text" id="fault"  class="input-field"  name="Fault"  value="<%=fault%>" style=" height: 80px; width:406px; margin-bottom:20px;" required autofocus/></lable>

<label><span>Spares Replaced <font color="red">*</font></span>
<input type="text"  class="input-field" name="SparesReplaced" id="sparesreplaced" style=" height: 80px; width:406px; margin-bottom:20px;" onKeyup="capitalize(this)" required autofocus/></lable>

<label><span>Amount<font color="red">*</font></span>
<input type="number" class="input-field" name="Amount" id="amount"  required autofocus/></label>

<label><span>Ticket Status<font color="red" size="2">*</font></span>
<select name="TicketStatus" id="ticketstatus" class="select-field">
<option>Select Ticket Status</option>
<option value="Closed">Completed</option>
<option value="Pending">Not Completed</option></select></label>

 <div class="button"><input type="submit" onclick="form.action='DealerServlet'" value="Submit" />
<input type="button" onclick="window.location.href='WelcomeDealer.jsp'" value="Cancel"/></label></div>
</form>
</div>
</main>
<nav id="nav">
			<div class="innertube">
				<h2>Dealer</h2>
				<ul>
				    <li><a href="WelcomeDealer.jsp">Home</a></li>
					<li><a href="DeliveryVehicle.jsp">Delivery Vehicle</a></li>
					
				</ul>
			</div>
		</nav>
</body>
</html>
 
 

