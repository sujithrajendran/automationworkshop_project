package suji.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import suji.bean.DealerShopBean;
import suji.util.DBconnection;

public class DealerShopDAO {
	Connection con=DBconnection.getDBConnection();
	public String generateshopid(String shopname) 
	{
		
		String result="";
		if(con!=null)
		{
			try 
			{
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery("select shop_seq.nextval from dual");
				while(rs.next())
				{
					result=result+rs.getInt(1);
				}
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			result=shopname.substring(0,3)+result;
			System.out.println("register shop sequence value" + result);
	}
		return result;
		
	}
	
	 
	 public String dealerdetails(DealerShopBean dealer )
		{
		String result="failed";
		if(con!=null)
		{
		try
		{
			PreparedStatement pst1=con.prepareStatement("insert into shopdetails(shopname,OwnerName,ShopAddress,Pincode,City,State,ShopEmailId,RepairVehicleType,ShopContactNumber,Dealerid,Shopid,area) values (?,?,?,?,?,?,?,?,?,?,?,?)" );
			pst1.setString(1,dealer.getShopName());
			pst1.setString(2,dealer.getOwnerName());
			pst1.setString(3,dealer.getShopAddress());
			pst1.setString(4,dealer.getPincode());
			pst1.setString(5,dealer.getCity());
			pst1.setString(6,dealer.getState());
			pst1.setString(7,dealer.getShopEmailId());
			pst1.setString(8,dealer.getRepairVehicleType());
			pst1.setString(9,dealer.getShopContactNumber());
			pst1.setString(10,dealer.getDealerId());
			pst1.setString(11,dealer.getShopId());
			pst1.setString(12, dealer.getArea());
			if(pst1.executeUpdate()>0)
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


	public String deleteshopdetails(String dealerid, String ownername, String shopemailid, String city) 
	{
		String result="Fail";
		if(con!=null)
		{
		try
		{
			PreparedStatement pst=con.prepareStatement("delete from shopdetails where  ownername=? and shopemailid=? and city=?");
			pst.setString(1,ownername);
			pst.setString(2,shopemailid);
			pst.setString(3,city);
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
			return result;
	
		}
	}
	
