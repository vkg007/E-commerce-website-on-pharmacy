package com.medicine.dao;


import com.medicine.model.medicine;
import java.sql.*;
import java.util.ArrayList;


/*
List of functions:-
1.insert
2.searchMed(id)
3.selectMedicine(id)
4.searchMed(med_name)
5.fetchType()
6.fetchcategory()
7.fetchseg()
8.fetchComposition
9.fetchmf
10.delRow(id)

*/
	
public class medicineDAO {
	private static final String SELECT_ID = "select * from medicine,manufacturer,composition,medicine_type,category where med_manufacturer=mf_license_no and med_drugname=comp_id and med_medtype=medtype_id and med_category=category_id and med_id= ?;";
    private static final String Select_all="select * from medicine,manufacturer,composition,medicine_type,category,segments where med_section=Seg_id and med_manufacturer=mf_license_no and med_drugname=comp_id and med_medtype=medtype_id and med_category=category_id;";

public medicine searchMed(int itemId) throws Exception {

	// make a query
	String selectQuery = "select med_id, med_name, med_price, med_mf_date, med_expiry, med_discount, mf_name,mf_address,comp_drug_name,comp_description,"+
	"medtype_name,category_name from medicine,manufacturer,composition,medicine_type,category where med_manufacturer=mf_license_no and med_drugname=comp_id and med_medtype=medtype_id and med_category=category_id and med_id="+ itemId;

	// shoe for return value
	medicine med = new medicine();

	// db connection
	try {

		Connection con=DBConnector.getConnection();
		PreparedStatement ps;
		
		ps = con.prepareStatement(selectQuery);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
				// store information
				med.setId(rs.getInt(1));
				med.setName(rs.getString(2));
				med.setPrice(rs.getFloat(3));
				med.setMf_date(rs.getString(4));
				med.setExpiry(rs.getString(5));
				med.setDis(rs.getFloat(6));
				med.setMf_name(rs.getString(7));
				med.setMf_add(rs.getString(8));
				med.setDrug_name(rs.getString(9));
				med.setDrug_desc(rs.getString(10));
				med.setType_name(rs.getString(11));
				med.setCat_name(rs.getString(12));
				
				

			}
		return med;
	}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
  catch (Exception e) {
		e.printStackTrace();
	} 

	// return
	return med;
}



	
	//select by id start--------------------------------------
	public medicine selectMedicine(int id) throws SQLException
	{
		medicine b=null;
		try
		{
			Connection con=DBConnector.getConnection();
			PreparedStatement ps=con.prepareStatement(SELECT_ID); 
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				System.out.println(rs.getString("med_name"));
				medicine med=new medicine();
				med.setName(rs.getString("med_name"));
				med.setPrice(rs.getFloat("med_price"));
				med.setDis(rs.getFloat("med_discount"));
				med.setMf_name(rs.getString("mf_name"));
				med.setSeg_name(rs.getString("Seg_name"));
				med.setType_name(rs.getString("medtype_name"));
				med.setDrug_name(rs.getString("comp_drug_name"));
				med.setDrug_desc(rs.getString("comp_description"));
				med.setCat_name(rs.getString("category_name"));
				med.setMf_add(rs.getString("mf_address"));
				med.setExpiry(rs.getString("med_expiry"));
				med.setMf_date(rs.getString("med_mf_date"));
				med.setId(rs.getInt("med_id"));
				 b=med;
    
			}
		      return b;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}
	
	//select end-------------------------------------------------------------
	//select all start------------------------------------------------------
	public ArrayList<medicine> selectAllMedicine() throws SQLException
	{
		ArrayList<medicine> b1=new ArrayList<>();
		try
		{
			Connection con=DBConnector.getConnection();
			PreparedStatement ps=con.prepareStatement(Select_all); 
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				medicine med=new medicine();
				med.setName(rs.getString("med_name"));
				med.setPrice(rs.getFloat("med_price"));
				med.setDis(rs.getFloat("med_discount"));
				med.setMf_name(rs.getString("mf_name"));
				med.setSeg_name(rs.getString("Seg_name"));
				med.setType_name(rs.getString("medtype_name"));
				med.setDrug_name(rs.getString("comp_drug_name"));
				med.setDrug_desc(rs.getString("comp_description"));
				med.setCat_name(rs.getString("category_name"));
				med.setMf_add(rs.getString("mf_address"));
				med.setExpiry(rs.getString("med_expiry"));
				med.setMf_date(rs.getString("med_mf_date"));
				med.setId(rs.getInt("med_id"));
				 b1.add(med);
				
			}
			 return b1;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b1;
	}
	//select all end---------------------------------------------------------------------------
	
	//select by name start--------------------------------------
		public ArrayList<medicine> searchmed(String medname) throws SQLException
		{
			ArrayList<medicine> medList = new ArrayList<medicine>();
			try
			{
				//String Search_name = "SELECT med_name FROM medicine WHERE med_name LIKE '"+medname+"%' LIMIT 10";
				 String Search_name="select* from medicine,manufacturer,composition,medicine_type,category where med_manufacturer=mf_license_no and med_drugname=comp_id and med_medtype=medtype_id and med_category=category_id and  med_name  LIKE '"+medname+"%' LIMIT 10";
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(Search_name); 
				//ps.setString(1,medname);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					//System.out.println(rs.getString("med_name"));
					medicine med=new medicine();
					med.setName(rs.getString("med_name"));
					med.setPrice(rs.getFloat("med_price"));
					med.setDis(rs.getFloat("med_discount"));
					med.setMf_name(rs.getString("mf_name"));
					med.setType_name(rs.getString("medtype_name"));
					med.setDrug_name(rs.getString("comp_drug_name"));
					med.setDrug_desc(rs.getString("comp_description"));
					med.setCat_name(rs.getString("category_name"));
					med.setMf_add(rs.getString("mf_address"));
					med.setExpiry(rs.getString("med_expiry"));
					med.setMf_date(rs.getString("med_mf_date"));
					med.setId(rs.getInt("med_id"));
					medList.add(med);
	     
				}
			      return medList;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return medList;
		}
		
		//select end-------------------------------------------------------------
	//delete by id start------------------------------------------------------------------------
	
	//delete end------------------------------------------------------------------------------
		public ArrayList<medicine> fetchtype() throws SQLException
		{
			String sql="select * from medicine_type";
			ArrayList<medicine> b1=new ArrayList<>();
			try
			{
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(sql); 
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					medicine med=new medicine();
					med.setType_id(rs.getInt("medtype_id"));
					med.setType_name(rs.getString("medtype_name"));
					 b1.add(med);
				}
				return b1;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return b1;

		
			
		}
		public ArrayList<medicine> fetchcategory() throws SQLException
		{
			String sql="select * from category";
			ArrayList<medicine> b1=new ArrayList<>();
			try
			{
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(sql); 
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					medicine med=new medicine();
					med.setCat_id(rs.getInt("category_id"));
					med.setCat_name(rs.getString("category_name"));
					 b1.add(med);
				}
				return b1;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return b1;

		
			
		}
		public ArrayList<medicine> fetchsegment() throws SQLException
		{
			String sql="select * from segments";
			ArrayList<medicine> b1=new ArrayList<>();
			try
			{
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(sql); 
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					medicine med=new medicine();
					med.setSeg_id(rs.getInt("Seg_id"));
					med.setSeg_name(rs.getString("Seg_name"));
					 b1.add(med);
				}
				return b1;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return b1;

		
			
		}
		public ArrayList<medicine> fetchcomposition() throws SQLException
		{
			String sql="select * from composition";
			ArrayList<medicine> b1=new ArrayList<>();
			try
			{
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(sql); 
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					medicine med=new medicine();
					med.setDrug_id(rs.getInt("comp_id"));
					med.setDrug_name(rs.getString("comp_drug_name"));
					 b1.add(med);
				}
				return b1;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return b1;

		
			
		}
		public ArrayList<medicine> fetchmanufacturer() throws SQLException
		{
			String sql="select * from manufacturer";
			ArrayList<medicine> b1=new ArrayList<>();
			try
			{
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(sql); 
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					medicine med=new medicine();
					med.setMf_id(rs.getInt("mf_license_no"));
					med.setMf_name(rs.getString("mf_name"));
					med.setMf_add(rs.getString("mf_address"));
					 b1.add(med);
				}
				return b1;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return b1;

		
			
		}
		public void delrow(int itemid) throws SQLException{
			String sql = "delete from medicine where med_id=?";

			// db connect
			try {

				// get connection
				Connection con=DBConnector.getConnection();
				PreparedStatement pst=con.prepareStatement(sql); 
				

				// set
				pst.setInt(1, itemid);

				// execute
				pst.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			
			
		}
		}
		public ArrayList<medicine> SerachCategory(String catname) throws SQLException
		{
			ArrayList<medicine> medList = new ArrayList<medicine>();
			try
			{
				//String Search_name = "SELECT med_name FROM medicine WHERE med_name LIKE '"+medname+"%' LIMIT 10";
				 String Search_name="select* from medicine,manufacturer,composition,medicine_type,category where med_manufacturer=mf_license_no and med_drugname=comp_id and med_medtype=medtype_id and med_category=category_id and  category_name=?";
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(Search_name); 
				ps.setString(1,catname);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					//System.out.println(rs.getString("med_name"));
					medicine med=new medicine();
					med.setName(rs.getString("med_name"));
					med.setPrice(rs.getFloat("med_price"));
					med.setDis(rs.getFloat("med_discount"));
					med.setMf_name(rs.getString("mf_name"));
					med.setType_name(rs.getString("medtype_name"));
					med.setDrug_name(rs.getString("comp_drug_name"));
					med.setDrug_desc(rs.getString("comp_description"));
					med.setCat_name(rs.getString("category_name"));
					med.setMf_add(rs.getString("mf_address"));
					med.setExpiry(rs.getString("med_expiry"));
					med.setMf_date(rs.getString("med_mf_date"));
					med.setId(rs.getInt("med_id"));
					medList.add(med);
	     
				}
			      return medList;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return medList;
		}
		
		//select end-------------------------------------------------------------
		public ArrayList<medicine> SerachSegCat(String segname,String catname) throws SQLException
		{
			ArrayList<medicine> medList = new ArrayList<medicine>();
			try
			{
				//String Search_name = "SELECT med_name FROM medicine WHERE med_name LIKE '"+medname+"%' LIMIT 10";
				 String Search_name="select* from medicine,manufacturer,composition,medicine_type,category,segments  where Seg_id=med_section and  med_manufacturer=mf_license_no and med_drugname=comp_id and med_medtype=medtype_id and med_category=category_id and   category_name=? and Seg_name=?";
				Connection con=DBConnector.getConnection();
				PreparedStatement ps=con.prepareStatement(Search_name); 
				ps.setString(1,catname);
				ps.setString(2,segname);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					//System.out.println(rs.getString("med_name"));
					medicine med=new medicine();
					med.setName(rs.getString("med_name"));
					med.setPrice(rs.getFloat("med_price"));
					med.setDis(rs.getFloat("med_discount"));
					med.setMf_name(rs.getString("mf_name"));
					med.setType_name(rs.getString("medtype_name"));
					med.setDrug_name(rs.getString("comp_drug_name"));
					med.setDrug_desc(rs.getString("comp_description"));
					med.setCat_name(rs.getString("category_name"));
					med.setMf_add(rs.getString("mf_address"));
					med.setExpiry(rs.getString("med_expiry"));
					med.setMf_date(rs.getString("med_mf_date"));
					med.setId(rs.getInt("med_id"));
					medList.add(med);
	     
				}
			      return medList;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return medList;
		}
		
		//select end-------------------------------------------------------------
	
	

}
