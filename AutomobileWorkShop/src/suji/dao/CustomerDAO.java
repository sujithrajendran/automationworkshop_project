package suji.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import suji.bean.CustomerBean;
import suji.bean.DeliveryBean;
import suji.servlet.EmailUtility;
import suji.util.DBconnection;

public class CustomerDAO 
{
	Connection con=DBconnection.getDBConnection();
	public String createticketnumber() 
	{
		String result="";
		String ticket="TICK";
		if(con!=null)
		{
			try 
			{
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery("select ticket_seq.nextval from dual");
				while(rs.next())
				{
					result=result+rs.getInt(1);
				}
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			result=ticket+result;
			System.out.println("register shop sequence value" + result);
	}
		return result;
	}
	public String getCustomerName(String customerid) {
		String result="";
		System.out.println("DAO-Customerid-"+customerid);
		if(con!=null)
		{
			try 
			{
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery("select firstname from details where id='"+customerid+"'");
				while(rs.next())
				{
					result=rs.getString(1);
				}
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		
			System.out.println("customername--" + result);
	}
		return result;
	}
	public String getDealerId(String shopid) {
		String result="";
		if(con!=null)
		{
			try 
			{
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery("select dealerid from shopdetails where shopid='"+shopid+"'");
				while(rs.next())
				{
					result=rs.getString(1);
				}
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		
			System.out.println("Shopid--" + result);
	}
		return result;
	}
	public String insertquery(CustomerBean cust) {
String result="failed";
		if(con!=null)
		{
		try
		{
			PreparedStatement pst=con.prepareStatement("insert into ticketquery (ticketnumber,ticketstatus,customername,vehicletype ,companyname ,vehiclemodel ,registernumber ,area ,pincode ,shopid ,dealerid ,mechanicid,fault,amount,deliverystatus,sparesreplaced,customerid) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
			pst.setString(1,cust.getTicketnumber());
			pst.setString(2,cust.getTicketstatus()); 
	        pst.setString(3,cust.getCustomername()); 
	        pst.setString(4,cust.getVehicletype()); 
	        pst.setString(5,cust.getCompanyname()); 
	        pst.setString(6,cust.getVehiclemodel()); 
	        pst.setString(7,cust.getRegisternumber()); 
	        pst.setString(8,cust.getArea()); 
	        pst.setString(9,cust.getPincode()); 
	        pst.setString(10,cust.getShopid()); 
	        pst.setString(11,cust.getDealerid()); 
	        pst.setString(12,cust.getMechanicid());
	        pst.setString(13,cust.getFault()); 
	        pst.setString(14,cust.getAmount()); 
			pst.setString(15,cust.getDeliverystatus()); 
	        pst.setString(16,cust.getSparesreplaced()); 
			pst.setString(17,cust.getCustomerid()); 
	          if(pst.executeUpdate()>0)
         {
         	result="Success";
         }
	    }
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		}
	return result;
	}
	public String sendingemail(String ticketnumber, String customername, String vehicletype, String companyname,
			String vehiclemodel, String fault, String mechanicid, String dealerid,String host, String port, String user, String pass, String shopid, String vehiclenumber,String customerid) {
		String customeraddress="";
		String cphonenumber="";
		String cemailid="";
		String shopname="";
		String saddress="";
		String sphonenumber="";
		String mechanicname="";
		String dealername="";
		String dealermailid="";
		String caddress="";
		String cmobilenumber="";
		String shopowner="";
		String city="";
		String result="";
		
		if(con!=null)
		{
			try
			{
			Statement st = con.createStatement();
		    ResultSet rs=st.executeQuery("select address,mobilenumber,emailid from details where id='"+customerid+"'");
		    while(rs.next()) 
		    { 
		      caddress = rs.getString(1);
		      cmobilenumber=rs.getString(2);
		       cemailid=rs.getString(3);
		    }
		} 
			catch(Exception e)
			 {
				System.out.println(e.toString()); 
			 }
		} 
		if(con!=null)
		{
			try
			{
			Statement st1 = con.createStatement();
		 
			ResultSet rs1=st1.executeQuery("select shopname,shopaddress,shopcontactnumber,ownername,city from shopdetails where shopid='"+shopid+"'");
		    while(rs1.next()) 
		    { 
		      shopname=rs1.getString(1);
		      saddress=rs1.getString(2);
		      sphonenumber=rs1.getString(3);
		      shopowner=rs1.getString(4);
		      city=rs1.getString(5);
		    }
		} 
			catch(Exception e)
			 {
				System.out.println(e.toString()); 
			 }
		} 
		if(con!=null)
		{
			try
			{
			Statement st2 = con.createStatement();
		    ResultSet rs2=st2.executeQuery("select mechanicname from mechanicdetails where mechanicid='"+mechanicid+"'");
		    while(rs2.next()) 
		    { 
		      mechanicname=rs2.getString(1);
		    }
		} 
			catch(Exception e)
			 {
				System.out.println(e.toString()); 
			 }
		}
		if(con!=null)
		{
			try
			{
			Statement st4 = con.createStatement();
		    ResultSet rs4=st4.executeQuery("select emailid,firstname from details where id='"+dealerid+"'");
		    while(rs4.next()) 
		    { 
		    	
		    	dealermailid=rs4.getString(1);
		    	dealername=rs4.getString(2);
		    	String recipient=dealermailid;
		    	String subject =ticketnumber+" - Assigned to your Shop";
		    	String content ="Hi "+dealername+","+"\n "
						+"\n"+" "
						+"\n"+"     "+"Ticket Number -"+ticketnumber+"\n"
						+"     "+"Customer Id - "+customerid+"\n"
						+"     "+"Customer Name -"+customername+"\n"
						+"     "+"Customer Address -"+caddress+"\n"
						+"     "+"Customer Mobile Number-"+cmobilenumber+"\n"
						+"     "+"Customer Mail Id -"+cemailid+"\n"
						+"     "+"Vehicle Type - "+vehicletype+"\n"
						+"     "+"Vehicle Company Name -"+companyname+"\n"
						+"     "+"Vehicle Model - "+vehiclemodel+"\n"
						+"     "+"Vehicle Register Number -"+vehiclenumber+"\n"
						+"     "+"Vehicle Fault -"+fault+"\n"
						+"     "+"Shop Owner Name - "+shopowner+"\n"
						+"     "+"Shop Name - "+shopname+"\n"
						+"     "+"Shop Address -"+saddress+"\n"
						+"     "+"City - "+city+"\n"
						+"     "+"Shop Contact Number -"+sphonenumber+"\n"
						+"     "+"Mechanic Name -"+mechanicname+"\n"
				        +"\n"+"Vehicle has been assigned to your Shop for repair"+"\n" 
				        +"\n"+"Kindly Repair the Vehicle"+"\n"
				        +"\n"+"Thank You!! Have a Good Day!!";
		    System.out.println("recipent-"+recipient);
		    System.out.println("subject-"+subject);
		    System.out.println("content-"+content);
				String resultMessage = "";

				try {
					EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
							content);
					resultMessage = "The e-mail was sent successfully";
				    } 
				catch (Exception ex) 
					{
					ex.printStackTrace();
					resultMessage = "There were an error: " + ex.getMessage();
				     } 
				result=resultMessage;
				}
		    }
			catch(Exception e)
			 {
				System.out.println(e.toString()); 
			 }
		} 
		return result;
	}
	public String cancelorder(DeliveryBean del) {
		String result="FAIL";
		
		if(con!=null)
		{
			try 
			{
				PreparedStatement pst=con.prepareStatement("update ticketquery set ticketstatus=? where ticketnumber=? and shopid=? and mechanicid=? ");
				pst.setString(1,del.getTicketstatus());
				pst.setString(2,del.getTicketnumber());
				pst.setString(3,del.getShopid());
				pst.setString(4,del.getMechanicid());
				if(pst.executeUpdate()>0)
                {
                	result="success";
                }
		    }
			catch (SQLException e) 
			{
				e.printStackTrace();
			} 
			
		System.out.println("result -" +result);
		
	}
		return result;
	}


		public String closedmailintimation(String customername, String ticketnumber, String ticketstatus,
				String vehicletype, String companyname, String vehiclemodel, String shopid, String mechanicid,
				String host, String port, String user, String pass, String customerid)
		{
			String customeraddress="";
			String cphonenumber="";
			String cemailid="";
			String shopname="";
			String saddress="";
			String sphonenumber="";
			String mechanicname="";
			String dealername="";
			String dealermailid="";
			String caddress="";
			String cmobilenumber="";
			String shopowner="";
			String city="";
			String result="";
			String dealerid="";
			if(con!=null)
			{
				try 
				{
					Statement st = con.createStatement();
					ResultSet rs=st.executeQuery("select dealerid from ticketquery where ticketnumber='"+ticketnumber+"' and shopid='"+shopid+"' and mechanicid='"+mechanicid+"' and ticketstatus='"+ticketstatus+"'");
					while(rs.next())
					{
						dealerid=rs.getString(1);
					}
				} 
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			
				System.out.println("dealerid--" + dealerid);
		}
			if(con!=null)
			{
				try
				{
				Statement st1 = con.createStatement();
			 
				ResultSet rs1=st1.executeQuery("select shopname,shopaddress,shopcontactnumber,ownername,city from shopdetails where shopid='"+shopid+"'");
			    while(rs1.next()) 
			    { 
			      shopname=rs1.getString(1);
			      saddress=rs1.getString(2);
			      sphonenumber=rs1.getString(3);
			      shopowner=rs1.getString(4);
			      city=rs1.getString(5);
			    }
			} 
				catch(Exception e)
				 {
					System.out.println(e.toString()); 
				 }
			} 
			if(con!=null)
			{
				try
				{
				Statement st2 = con.createStatement();
			    ResultSet rs2=st2.executeQuery("select mechanicname from mechanicdetails where mechanicid='"+mechanicid+"'");
			    while(rs2.next()) 
			    { 
			      mechanicname=rs2.getString(1);
			    }
			} 
				catch(Exception e)
				 {
					System.out.println(e.toString()); 
				 }
			}
			if(con!=null)
			{
				try
				{
				Statement st3 = con.createStatement();
			    ResultSet rs3=st3.executeQuery("select address,mobilenumber,emailid from details where id='"+customerid+"'");
			    while(rs3.next()) 
			    { 
			      caddress = rs3.getString(1);
			      cmobilenumber=rs3.getString(2);
			       cemailid=rs3.getString(3);
			    }
			} 
				catch(Exception e)
				 {
					System.out.println(e.toString()); 
				 }
			} 
	if(con!=null)
	{
		try
		{
		Statement st4 = con.createStatement();
	    ResultSet rs4=st4.executeQuery("select emailid,firstname from details where id='"+dealerid+"'");
	    while(rs4.next()) 
	    { 
	    	
	    	dealermailid=rs4.getString(1);
	    	dealername=rs4.getString(2);
	    	String recipient=dealermailid;
	    	String subject =ticketnumber+" - Cancelled by User";
	    	String content ="Hi "+dealername+","+"\n "
					+"\n"+" "
					+"\n"+"     "+"Ticket Number -"+ticketnumber+"\n"
					+"     "+"Customer Id - "+customerid+"\n"
					+"     "+"Customer Name -"+customername+"\n"
					+"     "+"Customer Address -"+caddress+"\n"
					+"     "+"Customer Mobile Number-"+cmobilenumber+"\n"
					+"     "+"Customer Mail Id -"+cemailid+"\n"
					+"     "+"Vehicle Type - "+vehicletype+"\n"
					+"     "+"Vehicle Company Name -"+companyname+"\n"
					+"     "+"Vehicle Model - "+vehiclemodel+"\n"
					+"     "+"Shop Owner Name - "+shopowner+"\n"
					+"     "+"Shop Name - "+shopname+"\n"
					+"     "+"Shop Address -"+saddress+"\n"
					+"     "+"City - "+city+"\n"
					+"     "+"Shop Contact Number -"+sphonenumber+"\n"
					+"     "+"Mechanic Name -"+mechanicname+"\n"
					+"     "+"Ticket Status -"+ticketstatus+"\n"
			        +"\n"+"Ticket assigned has been cancelled by User"+"\n" 
			        +"\n"+"Thank You!! Have a Good Day!!";
	    System.out.println("recipent-"+recipient);
	    System.out.println("subject-"+subject);
	    System.out.println("content-"+content);
			String resultMessage = "";

			try {
				EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
						content);
				resultMessage = "The e-mail was sent successfully";
			    } 
			catch (Exception ex) 
				{
				ex.printStackTrace();
				resultMessage = "There were an error: " + ex.getMessage();
			     } 
			result=resultMessage;
			}
	    }
		catch(Exception e)
		 {
			System.out.println(e.toString()); 
		 }
		}
	 return result;
}
}