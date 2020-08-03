<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%!String Mobilenumber=""; %>
    <%!String mnum=""; %>
       <%@ page import="java.sql.*" %>
    <%@ page import="suji.*" %>
        <%@page import="suji.util.*" %>
    <%@ page import="java.sql.Connection" %>  
    <%@ page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession"%>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import=" java.text.ParseException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
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
<script type="text/javascript" language="javascript">   
            function disableBackButton()
            {
            window.history.forward()
            }  
            disableBackButton();  
            window.onload=disableBackButton();  
            window.onpageshow=function(evt) { if(evt.persisted) disableBackButton() }  
            window.onunload=function() 
            { void(0)
            	}  
        </script>            
       <script>
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
                
            }
</script>

</head>
<body onload="checkcookie()">
<div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up</h1>
          <% session.setAttribute("signup","register"); %>
         <form name="val" action="register.jsp" method="post" onsubmit="return validate();">
           <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="FirstName" id="firstname" required autocomplete="off" onKeyup="capitalize(this)" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="LastName" id="lastname" required autocomplete="off" onKeyup="capitalize(this)"/>
            </div>
          </div>
          
	   <div class="field-wrap size">
            <label>
             Gender <span class="req">*</span>
              </label>
         <select class="field-wrap drop-down" name="gender" id="gender">
		<option>Gender</option>
		<option value="male">Male</option>
		<option value="female">Female</option>
		</select>
		</div>
		
          <div class="field-wrap">
            <label>
              Mobile Number<span class="req">*</span>
            </label>
            <input type="number" name="MobileNumber" id="mobilenumber"  required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label> 
              Email Id<span class="req">*</span>
            </label>
            <input type="email" name="EmailId" id="emailid" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
          <label>
              Address<span class="req">*</span>
            </label>
            <input type="text" name="Address" id="address" required autocomplete="off" onKeyup="capitalize(this)"/>
          </div>
          
          <div class="field-wrap size">
            <label>
             SignUp mode<span class="req">*</span>
              </label>
         <select class="field-wrap drop-down" name="user" id="user">
		<option>Signin mode</option>
		<option value="Dealer">Dealer</option>
		<option value="Customer">Customer</option>
		</select>
          </div>
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="Password" id="password" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
             Conform Password<span class="req">*</span>
            </label>
            <input type="password" name="ConformPassword" id="conformpassword" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap size">
            <label>
             Security Question <span class="req">*</span>
              </label>
        <select class="field-wrap drop-down" name="SecurityQuestion" id="securityquestion" >
		<option>Select Security Question</option>
		<option value="fathername">what is your father's name?</option>
		<option value="mothername">what is your mother's name?</option>
		<option value="friendname">what is your friend's name?</option>
		<option value="DOB">what is your DOB?</option>
		</select>
          </div>
          
          <div class="field-wrap">
            <label>
            Security Answer<span class="req">*</span>
            </label>
            <input type="text" name="SecurityAnswer" id="securityanswer" required autocomplete="off"/ onKeyup="capitalize(this)">
          </div>
          
           <button type="submit" class="button button-block" onclick="form.action='USerServlet'"/>SIGN UP</button>
          <%
       if(request!=null)
       {
			Cookie[] cc = request.getCookies();
			if(cc!=null)
			{
			for(int i=0;i<cc.length;i++)
			{
				 cc[i].setValue(""); 
			}
			}
       } %>
          </form>

        </div>
        
 <% session.setAttribute("loginoperation","login"); %> 
        <div id="login">   
          <h1>Welcome Back!</h1>
     
          <form name="val1" action="register.jsp" method="post">
            <div class="field-wrap">
            <label>
              Mobile Number<span class="req">*</span>
            </label>
            <input type="text" name="MobileNumber" id="mobilenumber" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="Password" id="password"  required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="Forgetpassword.jsp">Forgot Password?</a></p>
          
          <button class="button button-block" onclick="form.action='LoginServlet'"/>Log In</button>
          
          </form>

        </div>  
        
      </div>
      <%
       if(request!=null)
       {
			Cookie[] cc = request.getCookies();
			if(cc!=null)
			{
			for(int i=0;i<cc.length;i++)
			{
				 cc[i].setValue(""); 
			}
			}
       } %>
       
</div> <!-- /form -->
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>

</body>
</html>