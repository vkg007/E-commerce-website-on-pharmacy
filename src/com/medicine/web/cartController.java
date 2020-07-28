package com.medicine.web;

import com.medicine.dao.cartDAO;
import com.medicine.model.Customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/cartController")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		HttpSession sessionCustomer = request.getSession();
		Customer customer = (Customer)sessionCustomer.getAttribute("customer"); 
		
		if(customer==null ){
			// Dispatcher - forward to result page
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
 
		// param vars 
		String category = request.getParameter("category");
		String customerId = request.getParameter("customerId");
		String  itemName = request.getParameter("itemName");
	    float price =Float.parseFloat(request.getParameter("price"));
	    float discount =Float.parseFloat(request.getParameter("discount"));
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		cartDAO cartDao = new cartDAO();
		
		// search items

try {
			
			if(cartDao.check(customerId, itemId))
			{
				try {
					
					cartDao.updatecart(itemId, customerId);
				   }
					 
				   catch (Exception e) {
					
					e.printStackTrace();
				   }
			}
			
			else
			{
			// add to cart
			
			try {
				
				cartDao.insert(itemId,itemName, customerId, discount,1,price);
				 
			   } catch (Exception e) {
				
				e.printStackTrace();
			   }
			
			}
  }
catch (Exception e) {
	
	e.printStackTrace();
   }
		// set attribute
		request.setAttribute("category", category);
      
	 
		// Dispatcher - forward to result page
		getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
								
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
