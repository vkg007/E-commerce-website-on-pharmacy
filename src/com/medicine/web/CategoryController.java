package com.medicine.web;
import com.medicine.dao.medicineDAO;
import com.medicine.model.*;
import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cat=request.getParameter("catname");
		 String seg=request.getParameter("segname");
		//String cat="Anti Allergic";
		ArrayList<medicine> medList = new ArrayList<medicine>();
		 medicineDAO medDao=new medicineDAO();
		 if (seg !=null) {
			 try{
		    	  
					medList=medDao.SerachSegCat(seg,cat);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
     
		 }
		 else if(seg==null ) {
		 
		 try{
	    	  
				medList=medDao.SerachCategory(cat);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
		 }
		 
      request.setAttribute("medList", medList);
		
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher("/Search_Result.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
