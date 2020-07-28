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
 
@WebServlet("/MyCartHeader")
public class MyCartHeader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCartHeader() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		  HttpSession sessionCustomer = request.getSession();
     		Customer customer = (Customer)sessionCustomer.getAttribute("customer"); 
     		if(customer==null)
     		{
     			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
     		}
     		 
     		
     		cartDAO cartdao=new cartDAO();
        
     		
     		ArrayList<Cart> cartList = new ArrayList<Cart>();
     		try {
     			cartList = cartdao.listCart(customer.getCustomerId());
     		
     	        request.setAttribute("cartList", cartList);
     					
     		} catch (Exception e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		}
     		  
	
      
	                    	 
	                   		// Dispatcher - forward to result page
		                     
	                   		//getServletContext().getRequestDispatcher("/mycart.jsp").forward(request, response);
		
		 
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
