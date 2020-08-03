package suji.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import suji.dao.UserDAO1;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("login servlet inside");
		HttpSession session=request.getSession();
		String page=(String) session.getAttribute("loginoperation");
		UserDAO1 userdao=new UserDAO1();
		String output=""; 
		String getid="";
		PrintWriter out = response.getWriter();
		
		if(page.equals("login"))
		{
			System.out.println("login servelet");
			String MobileNumber=request.getParameter("MobileNumber");
			String Password=request.getParameter("Password");
			//System.out.println("mobile Number in servlet" +MobileNumber);
			//System.out.println("Password in servlet" +Password);
			getid=userdao.getcookiedetails(MobileNumber);
			System.out.println("cookies getid in servlet" +getid);
			
			output=userdao.validateLogin(MobileNumber,Password);
			
			System.out.println("login output in servlet" +output);
			
			Cookie c = new Cookie("id",getid);
			Cookie f= new Cookie("number",MobileNumber);
			response.addCookie(c);
			if(output.equals("Fail") || output.equals(""))
			{
				 out.println("<script type=\"text/javascript\">");
				 out.println("alert('Invalid Mobile Number or Password');");
				 out.println("location='register.jsp';");
				 out.println("</script>");
			}
			else if (output.equalsIgnoreCase("customer"))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('customer login Success');");
				out.println("location='WelcomeCustomer.jsp';");
				out.println("</script>");
			}
			else if (output.equalsIgnoreCase("dealer"))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Dealer login Success');");
				out.println("location='WelcomeDealer.jsp';");
				out.println("</script>");
			}
		else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Incorrect Mobile Number & Password');");
				out.println("location='register.jsp';");
				out.println("</script>");
			}  
		}

}
}