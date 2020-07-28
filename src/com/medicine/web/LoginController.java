package com.medicine.web;

import com.medicine.dao.*;
import com.medicine.model.*;
import java.io.IOException;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextPage = "";
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String mode = request.getParameter("userType");
if (mode != null && !mode.isEmpty()) 

{

          if(mode.equals("user"))
	{
        	  
			
		try {
               
			String sql ="select * from Customers where customerId=? and userpwd=?";
			
			// DB connection
			con = DBConnector.getConnection();

			// resultSet
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pwd);
			rs = pst.executeQuery();

			// move to last row to count rows
			rs.last();

			if (rs.getRow() == 0) {

				// fail to login
				request.setAttribute("loginMsg", "fail");
				nextPage = "/login.jsp";

			} else {

				// move to first row
				rs.beforeFirst();

				// get result
				while (rs.next()) {
					// customer
					Customer customer = new Customer();

					// get information
					customer.setCustomerId(rs.getString("customerId"));
					customer.setUserName(rs.getString("userName"));
					customer.setFirstName(rs.getString("firstName"));
					customer.setLastName(rs.getString("lastName"));
					customer.setAddress(rs.getString("address"));
					customer.setCity(rs.getString("city"));
					customer.setPostalCode(rs.getString("postalCode"));

					// set session
					HttpSession session = request.getSession();
					session.setAttribute("userType", "customer");
					session.setAttribute("customer", customer);
					session.setMaxInactiveInterval(120* 60 * 60); 

					nextPage = "/home.jsp";

				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 

		// forward to result page
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
	}
          else if(mode.equals("admin"))
          {
        	  try {

      			// create sql according to login type ( customer or CRS )
      			String sql = "";
      			sql = "select * from admin where email=? and pswrd=? ";

      			// DB connection
      			con = DBConnector.getConnection();

      			// resultSet
      			pst = con.prepareStatement(sql);
      			pst.setString(1, email);
      			pst.setString(2, pwd);
      			rs = pst.executeQuery();

      			// move to last row to count rows
      			rs.last();

      			if (rs.getRow() == 0) {

      				// fail to login
      				request.setAttribute("loginMsg", "fail");
      				nextPage = "/Admin_login.jsp";

      			} else {

      				// move to first row
      				rs.beforeFirst();

      				// get result
      				while (rs.next()) {

      					
      					Admin admin = new Admin();

      					
      					admin.setAdminId(rs.getInt("adminId"));
      					admin.setEmail(rs.getString("email"));
      					admin.setFname(rs.getString("firstName"));
      					admin.setLname(rs.getString("lastName"));
      					admin.setEmail(rs.getString("email"));
      					admin.setDate(rs.getString("joinDate"));
      					

      					// set session
      					HttpSession session = request.getSession();
      					session.setAttribute("userType", "admin");
      					session.setAttribute("admin", admin);
      					session.setMaxInactiveInterval(600 * 60); // for customer
      																// give 600
      																// minutes

      					nextPage = "Admin_index.jsp";

      				}

      			}

      		} catch (SQLException e) {
      			e.printStackTrace();
      		} catch (Exception e) {
      			e.printStackTrace();
      		} finally {
      			if (con != null)
      				try {
      					con.close();
      				} catch (SQLException e) {
      					e.printStackTrace();
      				}
      			if (pst != null)
      				try {
      					pst.close();
      				} catch (SQLException e) {
      					e.printStackTrace();
      				}
      			if (rs != null)
      				try {
      					rs.close();
      				} catch (SQLException e) {
      					e.printStackTrace();
      				}
      		}

      		// forward to result page
      		RequestDispatcher view = request.getRequestDispatcher(nextPage);
      		view.forward(request, response);

      	}

        	  
          
}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
