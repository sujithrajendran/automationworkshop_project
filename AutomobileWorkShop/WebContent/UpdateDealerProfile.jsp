
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
<title>UpdateProfile</title>
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
<% session.setAttribute("id",id);	
session.setAttribute("signup","updateprofile"); %>
<form action="/AutomobioleWorkShop/USerServlet" method="post">
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
					<li><a href="UpdateDealerProfile.jsp">Update Profile</a></li>		
				</ul>
			</div>
		</nav>
<main>


<<div class="tube">
<div class="form-style-2">
<div class="form-style-2-heading">Update Email Id</h2></div>

<label><span>Mobile Number <font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="MobileNumber" id="mobilenumber" value=<%=mobilenumber%>  readonly="readonly" required autofocus/></label>

<label><span>EmailId <font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="EmailId" id="emailid" required autofocus/></label>
              
<tr><td><label><span>Security Question<font color="red" size="2">*</font></span>
<select name="SecurityQuestion" id="securityquestion" class="select-field">
<option>Select Security Question</option>
		<option value="fathername">what is your father's name?</option>
		<option value="mothername">what is your mother's name?</option>
		<option value="friendname">what is your friend's name?</option>
		<option value="DOB">what is your DOB?</option></option></select></label>
       
       <label><span>Security Answer: <font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="SecurityAnswer" id="securityanswer"  onKeyup="capitalize(this)" required autofocus/></label>    

<div class="button"><input type="submit" onclick="form.action='USerServlet'" value="update" />
<input type="button" onclick="window.location.href='WelcomeDealer.jsp'" value="Cancel"/></label></div>
</div>
</main>
</body>
</html>