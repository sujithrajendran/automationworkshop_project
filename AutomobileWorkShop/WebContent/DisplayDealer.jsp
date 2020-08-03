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
<%!String shopid=""; %>
    <%!String mechanicid=""; %>
    <%!String mechanicname=""; %>
    <%!String mailid=""; %>
     <%!String age=""; %>
     <%!String address=""; %>
     <%!String pincode=""; %>
     <%!String phonenumber=""; %>
     <%!String state=""; %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Mechanic</title>
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

<form action="DisplayDealer.jsp" method="post">
<% String id="";
String shopid="";
String shopname="";
String mechanicid="";
String mechanicname=""; 
String mailid=""; 
 String age="";
 String address=""; 
 String pincode=""; 
 String phonenumber="";
 String state="";
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
				</font></h3>
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
	
		
			<label class="logoutLblPos">
			<img src="logout.png" onclick="window.location.href='register.jsp'" height="60%" width="60%" id="img">
  </label>
			</div>
</header>
<main>
			<div class="tube">
			<div class="form-style-2-heading">Display Mechanic Details</h2></div>
			
	<table id="tblData" border="1" align="center" cellspacing="15" bordercolor="black" class="raw-table raw-table-highlight-all" cellpadding="15">
			
			<tr>		
		<th><b><center><font color="blue" size="4">ShopId</font></center></b></th>
		<th><b><center><font color="blue" size="4">ShopName</font></center></b></th>
		<th><b><center><font color="blue" size="4">MechanicId</font></center></b></th>
		<th><b><center><font color="blue" size="4">Mechanic Name</font></center></b></th>
		<th><b><center><font color="blue" size="4">Phonenumbe </font></center></b></th>
		<th><b><center><font color="blue" size="4">MailId </font></center></b></th>
		<th><b><center><font color="blue" size="4">Age </font></center></b></th>
		<th><b><center><font color="blue" size="4">Address</font></center></b></th>
		<th><b><center><font color="blue" size="4">Pincode </font></center></b></th>
		<th><b><center><font color="blue" size="4">State</font></center></b></th>
	</tr>			

    	
   <% Connection conn=DBconnection.getDBConnection(); 
if(con!=null)
{
	int i=0;
	try
	{
		Statement st = conn.createStatement();
	    ResultSet rs=st.executeQuery("select shopid,mechanicid,mechanicname,phonenumber,mailid,age,address,pincode,state from mechanicdetails where dealerid='"+id+"' order by shopid ");
	    while(rs.next()) 
	    { 
	    	shopid=rs.getString(1);
	    	mechanicid=rs.getString(2);
	    	mechanicname=rs.getString(3);
	    	phonenumber=rs.getString(4);
	    	mailid=rs.getString(5);
	        age=rs.getString(6);
	    	address=rs.getString(7);
	    	pincode=rs.getString(8);
	    	state=rs.getString(9);
	        System.out.println("shopid-" +shopid+" "+" mechanicid-"+mechanicid+"mechanicname-"+mechanicname+"phonenumber-"+phonenumber+"mailid-"+mailid+"age-"+age+"address-"+address+"pincode-"+pincode+"state-"+state);
	        if(con!=null)
	        {
	   
	        try
	    	{
	    		Statement st1 = con.createStatement();
	    	    ResultSet rs1=st1.executeQuery("select shopname from shopdetails where shopid='"+shopid+"'");
	    	    while(rs1.next()) 
	    	    { 
	    	    	shopname=rs1.getString(1);
	    	    	System.out.println("shopname--"+ shopname);
	    	%>
	 
      <tr>
     <td><b><center><font color="black" size="3"><%=shopid %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=shopname %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=mechanicid %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=mechanicname %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=phonenumber%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=mailid%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=age%></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=address %></font></center></b></td>
     <td><b><center><font color="black" size="3"><%=pincode%> </font></center></b></td>
     <td><b><center><font color="black" size="3"><%=state%> </font></center></b></td>
     
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
				<h2>Dealer</h2>
				<ul>
				    <li><a href="WelcomeDealer.jsp">Home</a></li>
					<li><a href="DisplayDealer.jsp">Display Mechanic</a></li>
					
				</ul>
			</div>
		</nav>
		
		</form>
		</body>
		</html>
		
		
		
	