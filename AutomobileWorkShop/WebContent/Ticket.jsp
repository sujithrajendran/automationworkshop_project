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
    <%!String vehicletype=""; %>
    <%!String customername=""; %>
    <%!String customerid=""; %>
    <%!String sparedreplaced=""; %>
     <%!String companyname=""; %>
     <%!String vehiclemodel=""; %>
     <%!String registernumber=""; %>
     <%!String area=""; %>
     <%!String pincode=""; %>
     <%!String deliverystatus=""; %>
     <%!String shopid=""; %>
     <%!String mechanicid=""; %>
     <%!String dealerid=""; %>
      <%!String fault=""; %>
      <%!String amount=""; %>
             <%!String sparesreplaced=""; %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Page</title>
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
	function exportTableToExcel(tableID, filename = ''){
	    var downloadLink;
	    var dataType = 'application/vnd.ms-excel';
	    var tableSelect = document.getElementById(tableID);
	    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
	    
	    // Specify file name
	    filename = filename?filename+'.xls':'excel_data.xls';
	    
	    // Create download link element
	    downloadLink = document.createElement("a");
	    
	    document.body.appendChild(downloadLink);
	    
	    if(navigator.msSaveOrOpenBlob){
	        var blob = new Blob(['\ufeff', tableHTML], {
	            type: dataType
	        });
	        navigator.msSaveOrOpenBlob( blob, filename);
	    }else{
	        // Create a link to the file
	        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
	    
	        // Setting the file name
	        downloadLink.download = filename;
	        
	        //triggering the function
	        downloadLink.click();
	    }
	}
</script>
</head>
<body onload="checkcookie()">

<form action="Ticket.jsp" method="post">
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
			
	<table id="tblData" border="1" align="center" cellspacing="15" bordercolor="black" class="raw-table raw-table-highlight-all" cellpadding="15">
			
			<div class="input-field">	
			
			<tr>
		<th><b><center><font color="blue" size="4">TicketNumber</font></center></b></th>
		<th><b><center><font color="blue" size="4">TicketStatus</font></center></b></th>
		<th><b><center><font color="blue" size="4">CustomerName</font></center></b></th>
		<th><b><center><font color="blue" size="4">VehicleType</font></center></b></th>
		<th><b><center><font color="blue" size="4">CompanyName</font></center></b></th>
		<th><b><center><font color="blue" size="4">VehicleModel </font></center></b></th>
		<th><b><center><font color="blue" size="4">RegisterNumber</font></center></b></th>
		<th><b><center><font color="blue" size="4">Area</font></center></b></th>
		<th><b><center><font color="blue" size="4">Pincode</font></center></b></th>
		<th><b><center><font color="blue" size="4">ShopId</font></center></b></th>
		<th><b><center><font color="blue" size="4">DealerId</font></center></b></th>
		<th><b><center><font color="blue" size="4">MechanicId</font></center></b></th>
		<th><b><center><font color="blue" size="4">fault</font></center></b></th>
		<th><b><center><font color="blue" size="4">Amount</font></center></b></th>
		<th><b><center><font color="blue" size="4">DeliveryStatus</font></center></b></th>
		<th><b><center><font color="blue" size="4">SparesReplaced</font></center></b></th>
		<th><b><center><font color="blue" size="4">CustomerId</font></center></b></th>
	
	</tr>			 	
   <% Connection conn=DBconnection.getDBConnection(); 
if(con!=null)
{
	try
	{
		                                       
		Statement st = conn.createStatement();
	    ResultSet rs=st.executeQuery( "select ticketnumber,ticketstatus,customername,vehicletype,companyname,vehiclemodel,registernumber,area,pincode,shopid,dealerid,mechanicid,fault,amount,deliverystatus,sparesreplaced,customerid from ticketquery where customerid='"+id+"' and ticketstatus='Closed'");
	    while(rs.next()) 
	    { 
	    	ticketnumber=rs.getString(1);
	    	ticketstatus=rs.getString(2);
	    	customername=rs.getString(3);
	    	vehicletype=rs.getString(4);
	    	companyname=rs.getString(5);
	    	vehiclemodel=rs.getString(6);
	    	registernumber=rs.getString(7);
	    	area=rs.getString(8);
	    	pincode=rs.getString(9);
	    	shopid=rs.getString(10);
	    	dealerid=rs.getString(11);
	    	mechanicid=rs.getString(12);
	    	fault=rs.getString(13);
	    	amount=rs.getString(14);
	    	deliverystatus=rs.getString(15);
	    	sparesreplaced=rs.getString(16);
	    	customerid=rs.getString(17);
	       System.out.println(ticketnumber+" "+ticketstatus+" "+customername+" "+vehicletype+" "+companyname+
	    		   " "+vehiclemodel+" "+registernumber+" "+area+" "+pincode+" "+shopid+" "+dealerid+" "+
	    		   mechanicid+" "+fault+" "+amount+" "+deliverystatus+" "+sparesreplaced+" "+customerid);
	       
	    	%>
	 
      <tr>
     <td><b><center><font color="black" size="3"><%=ticketnumber %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=ticketstatus %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=customername %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=vehicletype %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=companyname%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=vehiclemodel%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=registernumber%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=area %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=pincode%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=shopid%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=dealerid %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=mechanicid %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=fault %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=amount %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=deliverystatus%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=sparesreplaced%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=customerid%></font></center></b></td>
     
     </tr> 
<% 
	  	    
	   
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
			<div class="button">
			<Button name="Download" onclick="exportTableToExcel('tblData')" class="new" value="Download /">Download</Button>
		</main>
		
	<nav id="nav">
			<div class="innertube">
				<h2>Customer</h2>
				<ul>
				<li><a href="WelcomeCustomer.jsp">Home</a></li>
					<li><a href="Ticket.jsp">View Ticket</a></li>				
				</ul>
			</div>
		</nav>
		</form>
</body>
</html>