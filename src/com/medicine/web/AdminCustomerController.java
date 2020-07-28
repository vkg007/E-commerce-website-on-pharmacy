package com.medicine.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medicine.dao.*;
import com.medicine.model.*;

/**
 * Servlet implementation class AdminCustomerController
 */
@WebServlet("/AdminCustomerController")
public class AdminCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomersDAO custDao= new CustomersDAO();	
		 
		// params 
		String mode = request.getParameter("mode");
		 
		// delete or edit info
		if(mode != null && !mode.isEmpty()) {
			 
			// customer id 
			String customerId = request.getParameter("customerId");
			 
			// delete customer
			if(mode.equals("del")) { 
				 
				try {
					custDao.delRow(customerId);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 
			// search customer's info 	
			}else if(mode.equals("search")) {
				 
				try {
					
					
					Customer customer = custDao.searchCustomer(customerId);
					
					
			        request.setAttribute("customer", customer);
					
					//////////////////////////
					// Dispatcher - forward to modification page
					getServletContext().getRequestDispatcher("/customerModify.jsp").forward(request, response);
						 
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
				
			// change order status	
			}else if(mode.equals("edit")) {
				
				// get params
			
				String pwd = request.getParameter("pwd");
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String address = request.getParameter("address");
				String city = request.getParameter("city");
				String postalCode = request.getParameter("postalCode");
				
				
				 
				try {
					
					custDao.updateRow(customerId, pwd, firstName, lastName, address, city, postalCode);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}


		}
		
		//////////////////////////
		// make orders Arraylist information 
		
		 ArrayList<Customer> customerList = new ArrayList<Customer>();
		 
		try {
			customerList = custDao.searchAllCustomer();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//////////////////////////
		// set attribute  
        request.setAttribute("customerList", customerList);
		
		
		//////////////////////////
		// Dispatcher - forward to list page
		getServletContext().getRequestDispatcher("/Admin_customerlist.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
