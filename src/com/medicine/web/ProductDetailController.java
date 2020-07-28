package com.medicine.web;
import com.medicine.model.*;
import com.medicine.dao.*;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/ProductDetailController")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int id=Integer.parseInt(request.getParameter("id"));
		//int id=11104;
		 
		medicineDAO medDao=new medicineDAO();
		ArrayList<medicine> medList = new ArrayList<medicine>();
		medicine med=new medicine();
		try
		{
			med=medDao.searchMed(id);
          medList=medDao.selectAllMedicine();
			
		}
		catch(Exception E)
		{
			
		}
		request.setAttribute("medList", medList);
		request.setAttribute("med", med);
		
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher("/productDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
