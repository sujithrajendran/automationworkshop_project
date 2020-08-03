package suji.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import suji.bean.DealerShopBean;
import suji.bean.DeliveryBean;
import suji.bean.MechanicBean;
import suji.dao.DealerShopDAO;
import suji.dao.DeliveryDAO;
import suji.dao.MechanicDetailsDAO;


public class DealerServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String page=(String) session.getAttribute("details");
		DealerShopDAO userdao1=new DealerShopDAO();
		String result="";
		PrintWriter out = response.getWriter();
		if(page.equals("registershop"))
	   {
			String dealerid=(String) (session.getAttribute("dealerid"));
		    String shopname=request.getParameter("ShopName");
			String ownername=request.getParameter("OwnerName");
			String shopaddress=request.getParameter("ShopAddress");
			String area=request.getParameter("Area");
			String pincode=request.getParameter("Pincode");
			String city=request.getParameter("City");
			String state=request.getParameter("State");
			String shopcontactnumber=request.getParameter("ShopContactNumber");
			String shopemailid=request.getParameter("ShopEmailId");
			String repairvehicletype=request.getParameter("vehicle");
			result=userdao1.generateshopid(shopname);
			System.out.println(" servlet result :"+ result);
			DealerShopBean dealer=new DealerShopBean();
			dealer.setShopName(shopname);
			dealer.setOwnerName(ownername);
			dealer.setShopAddress(shopaddress);
			dealer.setPincode(pincode);
			dealer.setArea(area);
			dealer.setCity(city);
			dealer.setState(state);
			dealer.setShopContactNumber(shopcontactnumber);
			dealer.setShopEmailId(shopemailid);
			dealer.setRepairVehicleType(repairvehicletype);
			dealer.setShopId(result);
			dealer.setDealerId(dealerid);
			System.out.println(shopname+" "+ownername+"  "+shopaddress+"  "+pincode+"   "+city+"  "+area+"  "+state+"  "+shopcontactnumber+"  "+shopemailid+"  "+repairvehicletype+" "+dealerid);
			result=userdao1.dealerdetails(dealer);
			if(result.equalsIgnoreCase("Success"))
			{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Shop Register Successfully');");
			out.println("location='WelcomeDealer.jsp';");
			out.println("</script>");
			}
			else 
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid pincode or Mobile number or emailid');");
				out.println("location='RegisterShop.jsp';");
				out.println("</script>");
			}
			}
		else if(page.equals("machanic"))
		{
			System.out.println("Servlet - Machanic");
			MechanicDetailsDAO mechanicdao=new MechanicDetailsDAO();
			
			String dealerid=(String) (session.getAttribute("dealerid"));
			String shopid=request.getParameter("Shopid").split("-")[1];
			String mechanicname=request.getParameter("MechanicName");
			String phonenumber=request.getParameter("PhoneNumber");
			String mailid=request.getParameter("MailId");
			String age=request.getParameter("Age");
			String address=request.getParameter("Address");
			String pincode=request.getParameter("Pincode");
			String state=request.getParameter("State");
			String result1 = mechanicdao.generatemechanicid(mechanicname);
			String mechanicid=result1;
			MechanicBean mech=new MechanicBean();
			mech.setMechanicId(mechanicid);
			mech.setDealerId(dealerid);
			mech.setShopId(shopid);
			mech.setMechanicName(mechanicname);
			mech.setPhoneNumber(phonenumber);
			mech.setMailId(mailid);
			mech.setAge(age);
			mech.setAddress(address);
			mech.setPincode(pincode);
			mech.setState(state);
			System.out.println("mechanic servlet result  "+ result1);
			result=mechanicdao.mechanicdetails(dealerid,shopid,mechanicid,mechanicname,phonenumber,mailid,age,address,pincode,state);
			System.out.println(dealerid+" "+shopid+" "+mechanicname+" "+phonenumber+" "+mailid+" "+age+" "+address+" "+pincode+" "+state+" "+mechanicid);
			if(result.equalsIgnoreCase("success"))
			{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Mechanic Details Entered');");
			out.println("location='WelcomeDealer.jsp';");
			out.println("</script>");
			}
			else 
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Register Failed ');");
				out.println("location='RegisterMachanic.jsp';");
				out.println("</script>");
			}
			}
		else if(page.equals("deletemechanic"))
	{
		MechanicDetailsDAO mechanicdao=new MechanicDetailsDAO();
		System.out.println("delete mechanic details:");
		String dealerid=(String) (session.getAttribute("dealerid"));
		String shopid=request.getParameter("Shopid").split("-")[1];
		String mechanicid =request.getParameter("MechanicId").split("-")[1];
		System.out.println(shopid+" "+mechanicid);
		result=mechanicdao.deletemechanic(dealerid,shopid,mechanicid);
		if(result.equalsIgnoreCase("success"))	
		   {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Mechanic Deleted successfully');");
			out.println("location='WelcomeDealer.jsp';");
			out.println("</script>");
			
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Select Correct Option');");
			out.println("location='DeleteMachanic.jsp';");
			out.println("</script>");
			
		}
		}
		else if(page.equals("deleteshop"))
		{
			System.out.println(" servlet-- delete shop ");
			String dealerid=(String) (session.getAttribute("dealerid"));
			String shopid=request.getParameter("Shopid").split("-")[1];
			String ownername=request.getParameter("OwnerName");
			String shopemailid=request.getParameter("ShopEmailId");
			String city=request.getParameter("City");
			result=userdao1.deleteshopdetails(dealerid,ownername,shopemailid,city);
			System.out.println("ownername-"+ownername+"shopemailid-"+shopemailid+"city-"+city);
			if(result.equalsIgnoreCase("success"))	
			   {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Shop Deleted successfully');");
				out.println("location='WelcomeDealer.jsp';");
				out.println("</script>");
				
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Select Correct Option');");
				out.println("location='DeleteShop.jsp';");
				out.println("</script>");
				
			}
			}
		else if(page.equals("delivery"))
		{
			DeliveryDAO delivery=new DeliveryDAO();
			System.out.println("delivery vehicle servlet");
			String dealerid=(String) (session.getAttribute("dealerid"));
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
		    del.setDealerid(dealerid);
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
		    result=delivery.DeliveryVehicle(del);
		    String email="";
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
				email=delivery.mailintimation(customername,ticketnumber,ticketstatus,vehicletype,companyname,vehiclemodel,shopid,dealerid,mechanicid,sparesreplaced,amount,host,port,user,pass);
				if(email.equalsIgnoreCase("The e-mail was sent successfully"))	
				   {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Ticket Closed & Email Send to Customer Successfully');");
					out.println("location='WelcomeDealer.jsp';");
					out.println("</script>");
					
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Email Failed to send!!');");
					out.println("location='DeliveryVehicle.jsp';");
					out.println("</script>");
					
				}
		    
		    }
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter correct data');");
				out.println("location='DeliveryVehicle.jsp';");
				out.println("</script>");
				
			}
		    
		}
		}
	}


	

