<%@page import="java.awt.Window"%>
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
<%!String ticketnumber=""; %>
    <%!String ticketstatus=""; %>
    <%!String mechanicname=""; %>
    <%!String vehicletype=""; %>
     <%!String companyname=""; %>
     <%!String vehiclemodel=""; %>
     <%!String registernumber=""; %>
     <%!String shopname=""; %>
     <%!String shopaddress=""; %>
     <%!String deliverystatus=""; %>
     <%!String shopid=""; %>
     <%!String mechanicid=""; %>
      <%!String fault=""; %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CustomerHomePage</title>
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
<form action="WelcomeCustomer.jsp" method="post">
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
<header id="header">
			<div id="logo">
				<h1>Vehicle Repair Shop</h1>
<%Object ticketnumber= request.getAttribute("ticketnumber"); 
 
 if(ticketnumber!=null)
 {
 %>
   <script type="text/javascript" language="javascript">
				alert('Ticket number - <%=ticketnumber%> Created & Email send to Shop')
			</script>
 <%} %>
<%Connection con=DBconnection.getDBConnection(); %>
            <%
            if (con != null) {
				try {
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select mobilenumber,firstname from details where id='"+id+"'");
					while (rs.next()) {
						mobilenumber = rs.getString(1);
						firstname=rs.getString(2);
					}
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				System.out.println("mobilenumber -"+mobilenumber);
				System.out.println("firstname -"+firstname.toUpperCase());
			}
            
            %>				
				<h3><font color="white">NAME: <%= firstname.toUpperCase() %>
				</font></h3>
				<label class="calendar">
		<img src="s.png" height="50%" width="50%" id="img">
			
			
			<label class="logoutLblPos">
			<img src="logout.png" onclick="window.location.href='register.jsp'" height="60%" width="60%" id="img">
  </label>
			</div>
</header>
		<main>
			<div class="tube">
			
	<table border="1" align="center" cellspacing="15" bordercolor="black" class="raw-table raw-table-highlight-all" cellpadding="15">
			
			<div class="input-field">	
			
			<tr>

		<th><b><center><font color="blue" size="4">TicketNumber</font></center></b></th>
		<th><b><center><font color="blue" size="4">TicketStatus</font></center></b></th>
		<th><b><center><font color="blue" size="4">VehicleType</font></center></b></th>
		<th><b><center><font color="blue" size="4">CompanyName</font></center></b></th>
		<th><b><center><font color="blue" size="4">Model </font></center></b></th>
		<th><b><center><font color="blue" size="4">RegisterNumber </font></center></b></th>
		<th><b><center><font color="blue" size="4">Shopname</font></center></b></th>
		<th><b><center><font color="blue" size="4">ShopAddress</font></center></b></th>
		<th><b><center><font color="blue" size="4">MechanicName</font></center></b></th>
		<th><b><center><font color="blue" size="4">DelivertStatus</font></center></b></th>
		<th><b><center><font color="blue" size="4">Fault</font></center></b></th>
	</tr>		
	
	 	
   <% Connection conn=DBconnection.getDBConnection(); 
if(con!=null)
{
	try
	{
		Statement st = conn.createStatement();
	    ResultSet rs=st.executeQuery( "select ticketnumber,ticketstatus,vehicletype,companyname,vehiclemodel,registernumber,deliverystatus,shopid,mechanicid,fault from ticketquery where customerid='"+id+"' and ticketstatus='In-Progress'");
	    while(rs.next()) 
	    { 
	    	ticketnumber=rs.getString(1);
	    	ticketstatus=rs.getString(2);
	    	vehicletype=rs.getString(3);
	    	companyname=rs.getString(4);
	    	vehiclemodel=rs.getString(5);
	    	registernumber=rs.getString(6);
	    	deliverystatus=rs.getString(7);
	    	shopid=rs.getString(8);
	    	mechanicid=rs.getString(9);
	    	fault=rs.getString(10);
	       System.out.println(ticketnumber+" "+ticketstatus+" "+vehicletype+" "+vehiclemodel+" "+registernumber+" "+deliverystatus+" "+shopid+" "+mechanicid+" "+fault);
	       if(shopid!=null)
	       {
	       if(con!=null)
	        {
	   
	        try
	    	{
	    		Statement st1 = con.createStatement();
	    	    ResultSet rs1=st1.executeQuery("select shopname,shopaddress from shopdetails where shopid='"+shopid+"'");
	    	    while(rs1.next()) 
	    	    { 
	    	    	shopname=rs1.getString(1);
	    	    	shopaddress=rs1.getString(2);
	    	    	System.out.println("shopname--"+ shopname+"shopaddress--"+shopaddress);
	    	    	if(mechanicid!=null)
	    	    	{
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
	    	%>
	 
      <tr>
     <td><b><center><font color="black" size="3"><%=ticketnumber %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=ticketstatus %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=vehicletype %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=companyname %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=vehiclemodel%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=registernumber%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=shopname%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=shopaddress %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=mechanicname%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=deliverystatus%> </font></center></b></td>
      <td><b><center><font color="black" size="3"><%=fault%> </font></center></b></td>
     </tr> 
 <% 
	  	       }
	       }
	   					 catch(Exception e)
						{
							System.out.println(e.toString()); 
						}
	   }
	    	    	}
	    	    }
	    	}
		catch(Exception e)
	 	{
		System.out.println(e.toString()); 
		 }
}
	        }
	    }
	}
	        catch(Exception e)
		 	{
			System.out.println(e.toString()); 
			 }
	}
	

%>		
 
			</div>
			</table>	
			</div>
		</main>
		
	<nav id="nav">
			<div class="innertube">
				<h2>Customer</h2>
				<ul>
				    <li><a href="CustomerProfile.jsp">Profile</a></li>	
					<li><a href="RaiseQuery.jsp">Raise Query</a></li>
					<li><a href="Ticket.jsp">View Ticket</a></li>	
					<li><a href="CancelOrder.jsp">Cancel Order</a></li>	
					<li><a href="ViewCancelOrder.jsp"> View Cancelled Ticket</a></li>				
				</ul>
			</div>
		</nav>
		</form>
</body>
</html>