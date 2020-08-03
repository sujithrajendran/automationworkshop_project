package suji.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import suji.bean.MechanicBean;
import suji.util.DBconnection;
	public class MechanicDetailsDAO 
		{
			Connection con=DBconnection.getDBConnection();
			public String generatemechanicid(String mechanicname)
			{
				System.out.println("generate mechanic id DAO");
				String result1="";
				if(con!=null)
				{
					try 
					{
						Statement st = con.createStatement();
						ResultSet rs=st.executeQuery("select mechanicid_seq.nextval from dual");
						while(rs.next())
						{
							result1=result1+rs.getInt(1);
						}
					} 
					catch (SQLException e)
					{
						e.printStackTrace();
					}
					result1=mechanicname.substring(0,3)+result1;
					System.out.println("sequence value" + result1);
			}
				return result1;
				
			}
			public String mechanicdetails(String dealerid,String shopid,String mechanicid,String mechanicname, String phonenumber,
					String mailid,String age, String address, String pincode, String state) {
				String result="Fail";
				if(con!=null)
				{
				try
				{
					PreparedStatement pst=con.prepareStatement("insert into mechanicdetails(dealerid,shopid,mechanicid,mechanicname,phonenumber,mailid,age,address,pincode,state) values (?,?,?,?,?,?,?,?,?,?)" );
					pst.setString(1,dealerid);
					pst.setString(2,shopid);
					pst.setString(3,mechanicid);
					pst.setString(4,mechanicname);
					pst.setString(5,phonenumber);
					pst.setString(6,mailid);
					pst.setString(7,age);
					pst.setString(8,address);
					pst.setString(9,pincode);
					pst.setString(10,state);
					
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
			public String deletemechanic(String Dealerid,String shopid,String mechanicid)
			{
			String result="Fail";
			if(con!=null)
			{
			try
			{
				PreparedStatement pst=con.prepareStatement("delete from mechanicdetails where dealerid=? and shopid=? and mechanicid=?");
				pst.setString(1,Dealerid);
				pst.setString(2,shopid);
				pst.setString(3,mechanicid);
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

