package com.medicine.web;

import com.medicine.dao.*;
import com.medicine.model.*;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/MyOrderController")
public class MyOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		HttpSession sessionCustomer = request.getSession();
		Customer customer = (Customer) sessionCustomer.getAttribute("customer");
		
		//String customerId=request.getParameter("customerId");

		// OrdersDAO obj
		OrdersDAO order = new OrdersDAO();

		
		// params
		String mode = request.getParameter("mode");

		// delete item or add quantity
		if (mode != null && !mode.isEmpty()) {

			// String orderId = request.getParameter(orderId);
			int orderId = Integer.parseInt(request.getParameter("orderId"));

			// delete ordered item
			if (mode.equals("del")) {

				try {
					order.delRow(orderId);
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// update quantity (+ 1 )
			} else if (mode.equals("add")) {

				int quantity = Integer.parseInt(request.getParameter("quantity"));

				try {
					order.addQty(orderId, quantity);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// update quantity (- 1)
			} else if (mode.equals("down")) {

				int quantity = Integer.parseInt(request.getParameter("quantity"));

				try {
					order.downQty(orderId, quantity);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		//////////////////////////
		// make orders Arraylist information

		ArrayList<Orders> ordersList = new ArrayList<Orders>();

		try {
			ordersList = order.listOrders(customer.getCustomerId());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//////////////////////////
		// set attribute
		request.setAttribute("ordersList", ordersList);

		//////////////////////////
		// Dispatcher - forward to result page
		getServletContext().getRequestDispatcher("/MyOrders.jsp").forward(request, response);

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
