package suji.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import suji.bean.UserBean;
import suji.dao.UserDAO1;
public class USerServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String page=(String) session.getAttribute("signup");
		UserDAO1 userdao=new UserDAO1();
		String output="";
		String result;
		PrintWriter out = response.getWriter();
		if(page.equals("register"))
		{
			System.out.println("user Servlet");
			String firstname=request.getParameter("FirstName");
			String lastname=request.getParameter("LastName");
			String mobilenumber=request.getParameter("MobileNumber");
			String address=request.getParameter("Address");
			String gender=request.getParameter("gender");
			String emailId=request.getParameter("EmailId");
			String password=request.getParameter("Password");
			String confirmpassword=request.getParameter("ConformPassword");
			String securityquestion=request.getParameter("SecurityQuestion");
			String securityanswer=request.getParameter("SecurityAnswer");
			String signupmode=request.getParameter("user");
			System.out.println(firstname+"  "+lastname+"  "+mobilenumber+" "+address+" "+gender+" "+emailId+" "+password+" "+confirmpassword+" "+signupmode+" "+securityquestion+" "+securityanswer);
			output=userdao.generateid(signupmode);
			System.out.println("Serverlet - sequence output" + output);
			if(password.length()>=8)
			{
				System.out.println("Inside servlet >8");
				UserBean user=new UserBean();
				System.out.println(user);
				user.setFirstName(firstname);
				user.setLastName(lastname);
				user.setMobileNumber(mobilenumber);
				user.setAddress(address);
				user.setGender(gender);
				user.setEmailID(emailId);
				user.setPassword(password);
				user.setConfirmPassword(confirmpassword);
				user.setSignupMode(signupmode);
				user.setSecurityQuestion(securityquestion);
				user.setSecurityAnswer(securityanswer);
				user.setId(output);
				result=userdao.register(user);
		        if(result.equalsIgnoreCase("Success"))
					{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('User Created');");
					out.println("location='register.jsp';");
					out.println("</script>");
				}
				else if (result.equalsIgnoreCase("Failed"))
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Mobile Number already Exist!!!');");
					out.println("location='register.jsp';");
					out.println("</script>");
				}
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Failed Password Constraint');");
				out.println("location='register.jsp';");
				out.println("</script>");
			}
		}
		
		else if(page.equals("changepass"))
		{
			System.out.println("forgetpass inside servlet");
			String MobileNumber=request.getParameter("MobileNumber");
			String SecurityQuestion=request.getParameter("SecurityQuestion");
			String SecurityAnswer=request.getParameter("SecurityAnswer");
			String Password=request.getParameter("Password");
			System.out.println(MobileNumber+ "--" +SecurityQuestion +"--"+SecurityAnswer +"--"+Password);
			output=userdao.changepass(Password,MobileNumber,SecurityQuestion,SecurityAnswer);
			System.out.println("serverlet output" + output);
		   if(output.equals("success"))	
		   {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Password changed successfully');");
			out.println("location='register.jsp';");
			out.println("</script>");
			
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('incorrect Security name & Answer');");
			out.println("location='Forgetpassword.jsp';");
			out.println("</script>");
			
		}
		
		}
	   else if(page.equals("updateprofile"))
	   {
		   System.out.println("update profile");
		   String id=(String) (session.getAttribute("id"));
			String mobilenumber=request.getParameter("MobileNumber");
			String emailid=request.getParameter("EmailId");
			String securityquestion=request.getParameter("SecurityQuestion");
			String securityanswer=request.getParameter("SecurityAnswer");
			System.out.println(mobilenumber+ "--" +securityquestion +"--"+securityanswer +"--"+emailid+"--"+id);
			output=userdao.updateprofile(mobilenumber,securityquestion,securityanswer,emailid,id);
			String val=id.substring(0,1);
			if(output.equalsIgnoreCase("success"))	
			   {
				 
				 if(val.equalsIgnoreCase("C"))
				 {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile updated successfully');");
				out.println("location='WelcomeCustomer.jsp';");
				out.println("</script>");
				 }
				 else
					 {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('profile updated successfully');");
					out.println("location='WelcomeDealer.jsp';");
					out.println("</script>");
					 }
			}
			else if(output.equalsIgnoreCase("FAIL") && val.equalsIgnoreCase("C"))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('incorrect SecurityQuestion and Securityanswer');");
				out.println("location='UpdateProfile.jsp';");
				out.println("</script>");
				
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('incorrect SecurityQuestion and Securityanswer');");
				out.println("location='UpdateDealerProfile.jsp';");
				out.println("</script>");
				
			}
			
			}

	}
}
	   

