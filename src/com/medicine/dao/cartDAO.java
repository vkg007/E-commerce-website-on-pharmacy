package com.medicine.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.medicine.model.Cart;
/*
 List of functions:-
 1.insert
 2.listcart
 3.deleteRow(id,cus_id)
 4.delAllRow
 5.check(id,item id)
 6.updateCart(id,cus_id)
 7.addQty(order id,quantity)
 8.downQty(order id,quantity)
 */

public class cartDAO {
	// connection 
	Connection con = null;
	PreparedStatement pst;  
	ResultSet rs = null;
	
	public void  insert(int itemId, String itemName,String customerId, float discount, int quantity, float price)
	{
		 String insertQuery = "insert into cart (cart_med_id,cart_med_name,cust_id,discount,cart_quantity,price) "
	        		+ "values (?,?,?,?,?,?)";
	        
	        
	        // db connect
	        try{
	        	
	        	// get connection
			    con = DBConnector.getConnection();
			    pst = con.prepareStatement(insertQuery);
			      
				// set
				pst.setInt(1,itemId);
				pst.setString(2,itemName);
				pst.setString(3,customerId);
				pst.setFloat(4, discount);
				pst.setInt(5,quantity);
				pst.setFloat(6,price);
				
				// execute
	            pst.executeUpdate();

	            
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        
	}
	
	
public ArrayList<Cart> listCart(String customerId) throws Exception{
		
		// make a query
		String selectQuery = "select cart_id, cart_quantity,cart_med_id,cart_med_name,price,cust_id, discount from cart where cust_id ='" + customerId + "' ";
		selectQuery = selectQuery + "order by cart_id asc";
        
		// result
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		
		// db connection
		try{
           
		    con = DBConnector.getConnection();
		    pst = con.prepareStatement(selectQuery);
		    
			try {
				rs = pst.executeQuery();
				
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}
			
			// save all list to ArrayList
			try {
				  
		         while(rs.next())
		  		 {
		        	 
		        	 Cart cart = new Cart();
			 	       
		        	 // store information	
		        	 cart.setCart_id(rs.getInt(1));
		        	 cart.setCart_quantity(rs.getInt(2));
		        	 cart.setCart_med_id(rs.getInt(3)); 
		        	 cart.setCart_med_name(rs.getString(4));
		        	 cart.setPrice(rs.getFloat(5));
		        	 cart.setCustomerId(rs.getString(6));
		        	 cart.setDiscount(rs.getFloat(7));
		        	 
		        		 
	        		// add to arraylist 
	        		cartList.add(cart); 
		 	   		 
		  		 }
		         
				
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
			 
		  
        }catch(Exception e){
                e.printStackTrace();
        }finally{
              
        	DBConnector.closeConnectionAll(con,pst,rs);
        }
		
		// return 
		return cartList;
	}
 public void deleteRow(int itemId,String customerId) throws Exception{
	// make a query
     String insertQuery = "delete from cart where cart_med_id=? and cust_id=?";
     
     
     // db connect
     try{
     	
     	// get connection
		    con = DBConnector.getConnection();
		    pst = con.prepareStatement(insertQuery);
		      
			// set
			pst.setInt(1,itemId); 
			pst.setString(2,customerId);
		 
			// execute
         pst.executeUpdate();

         
     }catch(Exception e){
         e.printStackTrace();
     }finally{
     	DBConnector.closeConnectionAll(con,pst,null);
     }
	 
 }
 public void delAllRows(String customerId)throws Exception {
	 
		
		// make a query
     String sQuery = "delete from cart where cust_id='"+ customerId +"'";
      
     // db connect
     try{
     	
     	// get connection
		    con = DBConnector.getConnection();
		    pst = con.prepareStatement(sQuery);
		  
			// execute
         pst.executeUpdate();

         
     }catch(Exception e){
         e.printStackTrace();
     }finally{
     	DBConnector.closeConnectionAll(con,pst,null);
     }
 }
 
 public boolean check(String customerId,int itemId)throws Exception {
	 
	 String query="select * from cart where cust_id=? and cart_med_id=?";
			 try {
	    con = DBConnector.getConnection();
	    pst = con.prepareStatement(query);
	    pst.setString(1,customerId);
	    pst.setInt(2, itemId);
	    rs = pst.executeQuery();
		rs.last();
	    if(rs.getRow()==0)
	    {
	    	return false;
	    }
	   
	    
			 }
          catch(Exception e){
     e.printStackTrace();
        }  
	  finally{
 	               DBConnector.closeConnectionAll(con,pst,null);
           }
			 return true;
 }
 public void  updatecart(int itemId,String customerId)
	{
	  String query= "update cart set cart_quantity=(cart_quantity+1) ,price =((price /(cart_quantity - 1)) * cart_quantity) where cust_id=? and  cart_med_id=?";
	  try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(query);
            pst.setString(1, customerId);
            pst.setInt(2, itemId);
			// set
			

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
 public void addQty(int orderId, int quantity) throws Exception {

		// make a query
		String insertQuery = "update cart set cart_quantity=" + quantity + ", " + "price = (price / (" + (quantity - 1)
				+ ")) * " + quantity + " where cart_id=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}
 public void downQty(int orderId, int quantity) throws Exception {

		// make a query
		String insertQuery = "update cart set cart_quantity=" + quantity + ", " + "price = (price / (" + (quantity + 1)
				+ ")) * " + quantity + " where cart_id=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}

	
 
 
 }
}



