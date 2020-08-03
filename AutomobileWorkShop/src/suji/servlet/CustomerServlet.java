package suji.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import suji.bean.CustomerBean;
import suji.bean.DeliveryBean;
import suji.dao.CustomerDAO;
import suji.dao.DeliveryDAO;
public class CustomerServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String page=(String) session.getAttribute("customer");
		String result="";
		RequestDispatcher rd;
		PrintWriter out = response.getWriter();
		if(page.equals("raisequery"))
		{
			System.out.println("query servlet ---");
			String customerid=(String) (session.getAttribute("customerid"));
			String vehicletype=request.getParameter("Vehicle");
			String companyname=request.getParameter("CompanyName");
			String vehiclemodel=request.getParameter("VehicleModel");
			String vehiclenumber=request.getParameter("VehicleNumber");
			String fault=request.getParameter("Fault");
			String city=request.getParameter("City");
			String pincode=request.getParameter("Pincode");
			String shopid=request.getParameter("Shopid").split("-")[1];
			String mechanicid=request.getParameter("MechanicId").split("-")[1];
			String ticketnumber="";
			String ticketstatus="In-Progress";
			String customername="";
			String dealerid="";
			String amount="0";
			String deliverystatus="pending";
			String spares="null";
			CustomerDAO query=new CustomerDAO();
			ticketnumber=query.createticketnumber();
			customername=query.getCustomerName(customerid);
			dealerid=query.getDealerId(shopid);
			System.out.println(customerid+" "+vehicletype+" "+companyname+" "+vehiclemodel+" "+
			vehiclenumber+" "+fault+" "+city+" "+pincode+" "+shopid+" "+mechanicid+" "+
			ticketnumber+" "+ticketstatus+" "+customername+" "+dealerid+" "+amount+" "+
			deliverystatus+" "+spares);
			CustomerBean cust=new CustomerBean();
			cust.setCustomerid(customerid);
			cust.setTicketnumber(ticketnumber);
			cust.setTicketstatus(ticketstatus);
			cust.setCustomerid(customerid);
			cust.setCustomername(customername);
			cust.setVehicletype(vehicletype);
			cust.setCompanyname(companyname);
			cust.setVehiclemodel(vehiclemodel);
			cust.setRegisternumber(vehiclenumber);
			cust.setArea(city);
			cust.setPincode(pincode);
			cust.setShopid(shopid);
			cust.setDealerid(dealerid);
			cust.setMechanicid(mechanicid);
			cust.setFault(fault);
			cust.setAmount(amount);
			cust.setDeliverystatus(deliverystatus);
			cust.setSparesreplaced(spares);
			result=query.insertquery(cust);
			 String email="";
			if(result.equalsIgnoreCase("Success"))
			{
				ServletContext context = getServletContext();
				String host = context.getInitParameter("host");
				String port = context.getInitParameter("port");
				String user = context.getInitParameter("user");
				String pass = context.getInitParameter("pass");
				System.out.println("email Servlet");
				System.out.println("host--"+host);
				System.out.println("port--"+port);
				System.out.println("user--"+user);
				System.out.println("pass--"+pass);
				email=query.sendingemail(ticketnumber,customername,vehicletype,companyname,vehiclemodel,fault,mechanicid,dealerid,host,port,user,pass,shopid,vehiclenumber,customerid);
				if(email.equalsIgnoreCase("The e-mail was sent successfully"))
				{
				request.setAttribute("ticketnumber",ticketnumber);
				rd=request.getRequestDispatcher("/WelcomeCustomer.jsp");
				rd.forward(request, response);
			    }
			    else 
			    {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Email Failed to send!!');");
				out.println("location='RaiseQuery.jsp';");
				out.println("</script>");
			    }
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter correct data');");
				out.println("location='RaiseQuery.jsp';");
				out.println("</script>");	
			}
		}
		else if(page.equals("cancelorder"))
		{
			CustomerDAO cancel=new CustomerDAO();
			System.out.println("delivery vehicle servlet");
			String customerid=(String) (session.getAttribute("customerid"));
			String ticketnumber=request.getParameter("TicketNumber");
			String customername=request.getParameter("CustomerName");
			String vehicletype=request.getParameter("VehicleType");
			String companyname=request.getParameter("CompanyName");
			String vehiclemodel=request.getParameter("VehicleModel");
			String area=request.getParameter("Area");
			String pincode=request.getParameter("Pincode");
			String shopid=request.getParameter("ShopName").split("-")[1];
			String mechanicid=request.getParameter("MechanicName").split("-")[1];
			String fault=request.getParameter("Fault");
			String sparesreplaced=request.getParameter("SparesReplaced");
			String amount=request.getParameter("Amount");
			String ticketstatus=request.getParameter("TicketStatus");
			String deliverystatus="Repaired";
			DeliveryBean del=new DeliveryBean();
		    del.setTicketnumber(ticketnumber);
		    del.setCustomername(customername);
		    del.setVehicletype(vehicletype);
		    del.setCompanyname(companyname);
		    del.setArea(area);
		    del.setShopid(shopid);
		    del.setMechanicid(mechanicid);
		    del.setFault(fault);
		    del.setSparesreplaced(sparesreplaced);
		    del.setAmount(amount);
		    del.setTicketstatus(ticketstatus);
		    del.setDeliverystatus(deliverystatus);
		    result=cancel.cancelorder(del);
		    String email = "";
		    if(result.equalsIgnoreCase("success"))
		    {
		    	ServletContext context = getServletContext();
				String host = context.getInitParameter("host");
				String port = context.getInitParameter("port");
				String user = context.getInitParameter("user");
				String pass = context.getInitParameter("pass");
				System.out.println("email Servlet");
				System.out.println("host--"+host);
				System.out.println("port--"+port);
				System.out.println("user--"+user);
				System.out.println("pass--"+pass);
				
				email=cancel.closedmailintimation(customername,ticketnumber,ticketstatus,vehicletype,companyname,vehiclemodel,shopid,mechanicid,host,port,user,pass,customerid);
				if(email.equalsIgnoreCase("The e-mail was sent successfully"))	
				   {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Ticket Cancelled & Email Send to the Shop');");
					out.println("location='WelcomeCustomer.jsp';");
					out.println("</script>");
					
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Email Failed to send!!');");
					out.println("location='CancelOrder.jsp';");
					out.println("</script>");
					
				}
		    
		    }
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter correct data');");
				out.println("location='CancelOrder.jsp';");
				out.println("</script>");
				
			}
		    
		}
		   
	}
}
	  
	

