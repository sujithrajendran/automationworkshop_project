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
<%!String firstname=""; %>
<%!String lastname=""; %>
<%!String mobilenumber=""; %>
<%!String emailid=""; %>
<%!String address="";%>
<%!String gender=""; %>
<%!String id="";%>
<%!String signupmode="";%>
     
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

<script type="text/javascript">
// Cookies to refresh the page:
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
<form action="CustomerProfile.jsp" method="post">

<link rel="stylesheet" type="text/css" href="UserProfile.css">
<%-- Cookies for getting the Id --%>
<%	
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
      <% Connection conn=DBconnection.getDBConnection(); 
if(conn!=null)
{
	try
	{
		Statement st = conn.createStatement();
	    ResultSet rs=st.executeQuery("select firstname,lastname,mobilenumber,emailid,address,gender,id,signupmode from details where id='"+id+"' ");
	    while(rs.next()) 
	    { 
	    	firstname=rs.getString(1);
	    	lastname=rs.getString(2);
	    	mobilenumber=rs.getString(3);
	    	emailid=rs.getString(4);
	    	address=rs.getString(5);
	    	gender=rs.getString(6);
	    	id=rs.getString(7);
	    	signupmode=rs.getString(8);

	        System.out.println("firstname-" +firstname+" "+" lastname-"+lastname+"mobilenumber-"+mobilenumber+"address-"+address+"emailid-"+emailid+"id-"+id+"signupmode-"+signupmode); 
	  	    
	   
	}
	}
		catch(Exception e)
	 	{
		System.out.println(e.toString()); 
		 }
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
<div class="container">
      <div class="cover-photo">
        <img src="display.png" class="profile">
      </div>
      <h1>
      <div class="profile-name">
       <span style="font-size:120%; color:#ffff80;"> <%=firstname %> <%=lastname%></div></h1>
       <div class="container1"> 
       </h3>
       <h3 class="about">
       <span style="font-size:120%; color:#ffffff;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Customer Id -</span>
       <span style="font-size:120%; color:#99ffff;">  <%=id%>
       </span>
       </h3>
       <h3 class="about">
      <span style="font-size:120%; color:#ffffff;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Contact -</span>
      <span style="font-size:120%; color:#99ffff;"> <%=mobilenumber%>
      </span> 
       </h3>
       <h3 class="about">
      <span style="font-size:120%; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Email Id -</span>
       <span style="font-size:120%; color:#99ffff;"> <%=emailid%>
      </span>
       </h3>
       <h3 class="about">
      <span style="font-size:120%; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Gender -</span>
     <span style="font-size:120%; color:#99ffff;"> <%=gender%>
      </span>
       </h3>
       <h3 class="about">
     <span style="font-size:120%; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Address -</span>
      <span style="font-size:120%; color:#99ffff;"> <%=address%>
      </span> 
       </h3>
       <br>
       <center>
     <a class="msg-btn" target="_blank" onclick="window.location.href='UpdateProfile.jsp'">Update</a>
 </div>
  </div> 
  </div>
    </center>
    </form>
    </main>
    <nav id="nav">
			<div class="innertube">
				<h2>Customer</h2>
				<ul>
				    <li><a href="WelcomeCustomer.jsp">Home</a></li>
					<li><a href="CustomerProfile.jsp">Profile</a></li>
					
				</ul>
			</div>
		</nav>
		
</body>
</html>
