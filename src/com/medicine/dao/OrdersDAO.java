package com.medicine.dao;


import com.medicine.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/*
List of functions:-
1.orderAllItems
2.listALLorders
3.listorders(id)
4.listorderPlaced(id)
5.delrow(order_id)
6.addQty(id,quantity)
7.downQty(id,quantity)
8.update status(id,status)
9.check(id,itemi_id)
10.updateorder(id)

*/

public class OrdersDAO {

	// connection
	Connection con = null;
	PreparedStatement pst;
	ResultSet rs = null;

	

	// move all items from cart to order
	public void orderAllItems(String customerId) throws Exception {

		// make a query
		String selectQuery = "select cart_med_id,cart_med_name , discount, cart_quantity, price from cart where cust_id =? order by cart_id asc";
				
		
		// db connection
				try {

					con = DBConnector.getConnection();
					pst = con.prepareStatement(selectQuery);
                    pst.setString(1, customerId);
					try {
						rs = pst.executeQuery();

					} 
					catch (SQLException e) {
						System.out.println(e.getMessage());
					}

					// save all list to ArrayList
					try {

			                    while (rs.next()) {
			                    	//checking if already present in order or not
			                    	

							
					// insert order
					String insertQuery = "Insert into Orders (itemId,customerId,itemName,discount, quantity,price,orderStatus,Orderdate) "
							+ "values (?,'" + customerId + "',?,?,?,?,'Order Placed',date(now()))";


					// db connect
					try {

						// get connection
						con = DBConnector.getConnection();
						pst = con.prepareStatement(insertQuery);
						

						// set
						pst.setInt(1, rs.getInt(1));
						pst.setString(2, rs.getString(2));
						pst.setFloat(3,rs.getFloat(3));
						pst.setInt(4, rs.getInt(4));
						pst.setFloat(5,rs.getFloat(5));
                     
						// execute
						pst.executeUpdate();

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						DBConnector.closeConnectionAll(con, pst, null);
					}
					
			                    		/////////////////////////////////////////////////////

				}

					} catch (SQLException e) {
						System.out.println(e.getMessage());
						e.printStackTrace();
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {

					DBConnector.closeConnectionAll(con, pst, rs);
				}

			}


			

	

	// ---------------------------------------------------------
	// METHOD listAllOrders()
	// ---------------------------------------------------------

	// return Arraylist for all orders with item name
	public ArrayList<Orders> listAllOrders() throws Exception {

		// make a query
		String selectQuery =  "select orderID, itemId, customerId, discount, quantity, price, orderStatus, Orderdate, itemName"
				+ " from orders o "  + " order by o.orderId asc";

		// result
		ArrayList<Orders> ordersList = new ArrayList<Orders>();

		// db connection
		try {

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

				while (rs.next()) {

					Orders order = new Orders();

					// store information
					order.setOrderId(rs.getInt(1));
					order.setItemId(rs.getInt(2));
					order.setCustomerId(rs.getString(3));
					order.setDiscount(rs.getFloat(4));
					order.setQuantity(rs.getInt(5));
					order.setPrice(rs.getDouble(6));
					order.setOrderStatus(rs.getString(7));
					order.setDate(rs.getString(8));
					order.setItemName(rs.getString(9));


					// add to arraylist
					ordersList.add(order);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return ordersList;
	}

	// ---------------------------------------------------------
	// METHOD listOrders()
	// ---------------------------------------------------------

	// return orders list for the specific customer id
	public ArrayList<Orders> listOrders(String customerId) throws Exception {

		// make a query
		String selectQuery =  "select orderID, itemId, customerId, discount, quantity, price, orderStatus, Orderdate, itemName"
				+ " from orders  " +"where customerId='" +customerId + "' order by orderId asc";
		
		// result
		ArrayList<Orders> ordersList = new ArrayList<Orders>();

		// db connection
		try {

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

				while (rs.next()) {

					Orders order = new Orders();

					// store information
					order.setOrderId(rs.getInt(1));
					order.setItemId(rs.getInt(2));
					order.setCustomerId(rs.getString(3));
					order.setDiscount(rs.getFloat(4));
					order.setQuantity(rs.getInt(5));
					order.setPrice(rs.getFloat(6));
					order.setOrderStatus(rs.getString(7));
					order.setDate(rs.getString(8));
					order.setItemName(rs.getString(9));

					// add to arraylist
					ordersList.add(order);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return ordersList;
	}

	// ---------------------------------------------------------
	// METHOD listOrdersPlaced()
	// ---------------------------------------------------------

	// return orders placed list for the specific customer id
	public ArrayList<Orders> listOrdersPlaced(String customerId) throws Exception {

		// make a query
		/*String selectQuery="select orderID, itemId, customerId, discount, quantity, price, orderStatus, Orderdate, itemName "+ ""
				+ "from orders where customerId ="+customerId+
				" and orderStatus = 'Order Placed' and and time >= NOW() - INTERVAL 5 MINUTE order by orderId asc";
		*/
		String selectQuery = "select orderID, itemId, customerId, discount, quantity, price, orderStatus, Orderdate, itemName "
				+ " from orders " + " where customerId ='" + customerId
				+ "' and orderStatus = 'Order Placed' and time >= NOW() - INTERVAL 5 MINUTE " + " order by orderId asc";

		// result
		ArrayList<Orders> ordersList = new ArrayList<Orders>();

		// db connection
		try {

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

				while (rs.next()) {

					Orders order = new Orders();

					// store information
					order.setOrderId(rs.getInt(1));
					order.setItemId(rs.getInt(2));
					order.setCustomerId(rs.getString(3));
					order.setDiscount(rs.getFloat(4));
					order.setQuantity(rs.getInt(5));
					order.setPrice(rs.getDouble(6));
					order.setOrderStatus(rs.getString(7));
					order.setDate(rs.getString(8));
					order.setItemName(rs.getString(9));

					// add to arraylist
					ordersList.add(order);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return ordersList;
	}

	// ---------------------------------------------------------
	// METHOD delRow()
	// ---------------------------------------------------------

	public void delRow(int orderId) throws Exception {

		// make a query
		String insertQuery = "delete from Orders where orderId=?";

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

	// ---------------------------------------------------------
	// METHOD addQty()
	// ---------------------------------------------------------

	public void addQty(int orderId, int quantity) throws Exception {

		// make a query
		String insertQuery = "update Orders set quantity=" + quantity + ", " + "price = (price / (" + (quantity - 1)
				+ ")) * " + quantity + " where orderId=?";

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

	// ---------------------------------------------------------
	// METHOD addQty()
	// ---------------------------------------------------------

	public void downQty(int orderId, int quantity) throws Exception {

		// make a query
		String insertQuery = "update Orders set quantity=" + quantity + ", " + "price = (price / (" + (quantity + 1)
				+ ")) * " + quantity + " where orderId=?";

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

	// ---------------------------------------------------------
	// METHOD updateStatus()
	// ---------------------------------------------------------

	public void updateStatus(int orderId, String orderStatus) throws Exception {

		// make a query
		String insertQuery = "update orders set orderStatus = ?  where orderId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setString(1, orderStatus);
			pst.setInt(2, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}
	 public boolean check(String customerId,int itemId)throws Exception {
		 
		 String query="select * from orders where customerId=? and itemId=?";
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
	 public void  updateorder(int itemId,String customerId,int quant)
		{
		  String query= "update orders set quantity=(quantity+ ?) ,price =((price /quantity - ?)) * ?) where customerId=? and  itemId=?";
		  try {

				// get connection
				con = DBConnector.getConnection();
				pst = con.prepareStatement(query);
				pst.setInt(1, quant);
				pst.setInt(2, quant);
				pst.setInt(3, quant);
	            pst.setString(4, customerId);
	            pst.setInt(5, itemId);
				// set
				

				// execute
				pst.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
}
