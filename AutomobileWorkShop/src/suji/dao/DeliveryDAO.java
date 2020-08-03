package suji.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;

import suji.servlet.EmailUtility;
import suji.bean.DeliveryBean;
import suji.util.DBconnection;

public class DeliveryDAO {
	Connection con=DBconnection.getDBConnection();
	public String DeliveryVehicle(DeliveryBean del) {
		String result="FAIL";
		if(con!=null)
		{
			try 
			{
				PreparedStatement pst=con.prepareStatement("update ticketquery set ticketstatus=?,amount=?,deliverystatus=?,sparesreplaced=? where ticketnumber=? and dealerid=? and shopid=? and mechanicid=? ");
				pst.setString(1,del.getTicketstatus());
				pst.setString(2,del.getAmount());
				pst.setString(3,del.getDeliverystatus());
				pst.setString(4,del.getSparesreplaced());
				pst.setString(5,del.getTicketnumber());
				pst.setString(6,del.getDealerid());
				pst.setString(7,del.getShopid());
				pst.setString(8,del.getMechanicid());
				if(pst.executeUpdate()>0)
                {
                	result="success";
                }
		    }
			catch (SQLException e) 
			{
				e.printStackTrace();
			} 
	}
		System.out.println("result -" +result);
		return result;
	}
	public String mailintimation(String customername, String ticketnumber, String ticketstatus, String vehicletype,
			String companyname, String vehiclemodel, String shopid, String dealerid, String mechanicid,
			String sparesreplaced, String amount, String host, String port, String user, String pass) 
	{
		String result = "";
	    String dealername = "";
		String shopname="";
		String city="";
		String contactnumber="";
		String shopmailid="";
		String mechanicname="";
		String customerid = "";
		String vehiclenumber ="";
		String customermailid="";
		String shopaddress="";
		
		if(con!=null)
		{
			try
			{
			Statement st = con.createStatement();
		    ResultSet rs=st.executeQuery("select firstname from details where id='"+dealerid+"'");
		    while(rs.next()) 
		    { 
		      dealername=rs.getString(1);
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
		    ResultSet rs1=st1.executeQuery("select shopname,shopaddress,city,shopcontactnumber,shopemailid from shopdetails where shopid='"+shopid+"'");
		    while(rs1.next()) 
		    { 
		      shopname=rs1.getString(1);
		      shopaddress=rs1.getString(2);
		      city=rs1.getString(3);
		      contactnumber=rs1.getString(4);
		      shopmailid=rs1.getString(5);
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
		    ResultSet rs3=st3.executeQuery("select customerid,registernumber from ticketquery where ticketnumber='"+ticketnumber+"' and shopid='"+shopid+"'");
		    while(rs3.next()) 
		    { 
		      customerid=rs3.getString(1);
		      vehiclenumber=rs3.getString(2);
		    }
		} 
			catch(Exception e)
			 {
				System.out.println(e.toString()); 
			 }
		} 
		System.out.println("DAO--");

		if(con!=null)
		{
			try
			{
			Statement st4 = con.createStatement();
		    ResultSet rs4=st4.executeQuery("select emailid from details where id='"+customerid+"'");
		    while(rs4.next()) 
		    { 
		    	customermailid=rs4.getString(1);
		    	String recipient=customermailid;
		    	String subject =ticketnumber+" - Vehicle Repaired Successfully";
				String content ="Hi "+customername+","+"\n "
						+"\n"+"Your Vechicle has been repaired successfully. Please find the vechicle details below "+"\n"
						+"\n"+"     "+"Ticket Number -"+ticketnumber+"\n"
						+"     "+"Customer Id - "+customerid+"\n"
						+"     "+"Ticket Status -"+ticketstatus+"\n"
						+"     "+ "Vehicle Type - "+vehicletype+"\n"
						+"     "+"Vehicle Company Name -"+companyname+"\n"
						+"     "+ "Vehicle Model - "+vehiclemodel+"\n"
						+"     "+"Vehicle Register Number -"+vehiclenumber+"\n"
						+"     "+"Shop Owner Name - "+dealername+"\n"
						+"     "+"Shop Name - "+shopname+"\n"
						+"     "+"Shop Address -"+shopaddress+"\n"
						+"     "+ "City - "+city+"\n"
						+"     "+"Shop Contact Number -"+contactnumber+"\n"
						+"     "+ "Shop Mail Id - "+shopmailid+"\n"
						+"     "+"Mechanic Name -"+mechanicname+"\n"
						+"     " +"Spares Replaced - "+sparesreplaced+"\n"
				        +"     " +"Total Bill Amount -"+amount+"\n"
				        +"\n"+"Please come and collect your vehicle"+"\n" 
				        +"\n"+"Kindly Contact us if you are facing any issues"+"\n"
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
