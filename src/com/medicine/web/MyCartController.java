package com.medicine.web;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.medicine.model.*;
import com.medicine.dao.*;
 
@WebServlet("/MyCartController")
public class MyCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCartController() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String mode = request.getParameter("mode");
		cartDAO cartdao=new cartDAO();
	

               
		 
		 if (mode != null && !mode.isEmpty()) {
			
				int cartId = Integer.parseInt(request.getParameter("cartId"));
			
				 if (mode.equals("add")) {

					int quantity = Integer.parseInt(request.getParameter("quantity"));

					try {
						cartdao.addQty(cartId, quantity);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					// update quantity (- 1)
				} else if (mode.equals("down")) {

					int quantity = Integer.parseInt(request.getParameter("quantity"));

					try {
						cartdao.downQty(cartId, quantity);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

		 }
	                      
	                    	   HttpSession sessionCustomer = request.getSession();
	                   		Customer customer = (Customer)sessionCustomer.getAttribute("customer"); 
	                   		
	                   		  if(customer==null ){
	                   			// Dispatcher - forward to result page
	                   			getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
	                   		   }
	                      
	                   		
	                   		ArrayList<Cart> cartList = new ArrayList<Cart>();
	                   		try {
	                   			cartList = cartdao.listCart(customer.getCustomerId());
	                   		
	                   	        request.setAttribute("cartList", cartList);
	                   					
	                   		} catch (Exception e) {
	                   			// TODO Auto-generated catch block
	                   			e.printStackTrace();
	                   		}
	                   		 
	                   		// Dispatcher - forward to result page
	                   		getServletContext().getRequestDispatcher("/mycart.jsp").forward(request, response);
		
		 
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
