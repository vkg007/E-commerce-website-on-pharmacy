package com.medicine.web;
import com.medicine.model.*;

import com.medicine.dao.*;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

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


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public RegisterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action1=request.getParameter("action1");
		switch(action1)
		{
		
			
			
		case"register":
			try {
				register(request,response);
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			break;
			
		case"admin":
			try {
				PrintWriter out = response.getWriter();  
				out.println("admin");
				adminregister(request,response);
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			break;
		
		
		
			default:
				try {
				updateform(request, response);
				} catch (Throwable e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			
				break;
			
		}
	
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String nextPage = "";

		// variables

		// get params
		String category = request.getParameter("category");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String mob=request.getParameter("mob");

		try {

			// 1. validate email address

			// DB connection
			con = DBConnector.getConnection();

			String sql = "";

			if (category.equals("Customers")) {
				sql = "select * from Customers where customerId=? or mobile=?";
			} 

			// resultSet
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, mob);
			rs = pst.executeQuery();

			// move to last row to count rows
			rs.last();

			// 2. register
			if (rs.getRow() == 0) {

				if (category.equals("Customers")) {
					// extra info
					String address = request.getParameter("address");
					String city = request.getParameter("city");
					String postalCode = request.getParameter("postalCode");

					// insert query
					String insertQuery = "insert into customers "
							+ " (customerId, username, userpwd, firstname, lastname, address, city, postalCode,mobile) values (?,?,?,?,?,?,?,?,?)";

					pst = con.prepareStatement(insertQuery);

					// set
					pst.setString(1, email);
					pst.setString(2, firstName + " " + lastName);
					pst.setString(3, pwd);
					pst.setString(4, firstName);
					pst.setString(5, lastName);
					pst.setString(6, address);
					pst.setString(7, city);
					pst.setString(8, postalCode);
					pst.setString(9,mob);

					int chk = pst.executeUpdate();

					// print result
					if (chk == 0) {

						request.setAttribute("Msg", "fail");
						nextPage = "/login.jsp";

					} else {

						// customer
						Customer customer = new Customer();

						// get information
						customer.setCustomerId(email);
						customer.setFirstName(firstName);
						customer.setLastName(lastName);
						customer.setUserName(firstName + " " + lastName);
						customer.setAddress(address);
						customer.setCity(city);
						customer.setPostalCode(postalCode);
						customer.setMob(mob);

						// session
						HttpSession session = request.getSession();
						session.setAttribute("userType", "customer");
						session.setAttribute("customer", customer);

						// forward page
						nextPage = "/home.jsp";
					}

					// CSR
				} 


				// 2.2 fail to register
			} 
			else {

				request.setAttribute("Msg", "email");
				nextPage = "/login.jsp";

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
	private void adminregister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		String nextPage = "";
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		PrintWriter out = response.getWriter();  
		out.println(email+" "+firstName+" " +lastName+" "+pwd);
try {
		
		String sql = "select * from admin where email=? ";
	

	// resultSet
		con = DBConnector.getConnection();
	pst = con.prepareStatement(sql);
	pst.setString(1, email);
	rs = pst.executeQuery();

	// move to last row to count rows
	rs.last();

	// 2. register
if (rs.getRow() == 0) {
	//PrintWriter out = response.getWriter();  
			out.println(email+" "+firstName);
		// insert query
		String insertQuery = "insert into admin "
				+ " (email,firstName,pswrd,lastName,joinDate) values (?,?,?,?,date(now()))";

		pst = con.prepareStatement(insertQuery);

		// set
		pst.setString(1, email);
		pst.setString(2, firstName);
		pst.setString(3, pwd);
		pst.setString(4, lastName);

		int chk = pst.executeUpdate();

		// print result
		if (chk == 0) {

			request.setAttribute("Msg", "fail");
			nextPage = "/Admin_register.jsp";

		}else {

			
			Admin admin = new Admin();

				
			
				admin.setEmail(email);
				admin.setFname(firstName);
				admin.setLname(lastName);
				
				

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
	else
	{
		request.setAttribute("Msg", "email");
		nextPage = "/Admin_register.jsp";

	}

}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
		
	}
	private void updateform(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String postalCode = request.getParameter("postalCode");
		
		CustomersDAO custDao=new CustomersDAO();
        custDao.updateRow(email,pwd,firstName,lastName,address,city,postalCode);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EditProfile.jsp");
       
        dispatcher.forward(request, response);
		}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
