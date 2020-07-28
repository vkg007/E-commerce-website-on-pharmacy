package com.medicine.web;

import java.io.IOException;
import java.io.InputStream;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.medicine.dao.*;
import com.medicine.model.*;

/**
 * Servlet implementation class Admin_productlist
 */
@WebServlet("/AdminproductlistController")
public class AdminproductlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminproductlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	medicineDAO medDao= new medicineDAO();	
		 
		// params 
		String mode = request.getParameter("mode");
		 
		// delete or edit info
		if(mode != null && !mode.isEmpty()) {
			 
			// customer id 
			int itemId =Integer.parseInt( request.getParameter("itemId"));
			 
			// delete customer
			if(mode.equals("del")) { 
				 
				try {
					medDao.delrow(itemId);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 
			// search customer's info 	
			}else if(mode.equals("search")) {
				 
				try {
					
					
					medicine med = medDao.searchMed(itemId);
					
					
			        request.setAttribute("medicine", med);
					
					//////////////////////////
					// Dispatcher - forward to modification page
					getServletContext().getRequestDispatcher("/Admin_Addproduct.jsp").forward(request, response);
						 
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
				
			// change order status	
			}else if(mode.equals("edit")) {
				
				// get params
				String name=request.getParameter("name");
				Float price=Float.parseFloat(request.getParameter("price"));
				Float discount=Float.parseFloat(request.getParameter("discount"));
				String mf_date=request.getParameter("mf_date");
				String expiry=request.getParameter("expiry_date");
				int type=Integer.parseInt(request.getParameter("type"));
				int category=Integer.parseInt(request.getParameter("category"));
				int seg=Integer.parseInt(request.getParameter("segment"));
				int mf=Integer.parseInt(request.getParameter("mf"));
				int drug=Integer.parseInt(request.getParameter("drug"));
				 InputStream inputStream = null; // input stream of the upload file

			        // obtains the upload file part in this multipart request
			        Part filePart = request.getPart("image");
			        if (filePart != null) {
			          // obtains input stream of the upload file
			            inputStream = filePart.getInputStream();
			        }
				
			        try {
						String insertQuery = "update into medicine "
								+ "(set med_name=?,med_price=?,med_discount=?,med_mf_date=?,med_expiry=?,med_medtype=?,med_category=?,med_drugname=?,med_manufacturer=?,med_section=?,med_image=? where med_id=?)";
						Connection con=DBConnector.getConnection();
						PreparedStatement pst;
						
						pst = con.prepareStatement(insertQuery);
						// set
						pst.setString(1, name);
						pst.setFloat(2, price);
						pst.setFloat(3, discount);
						pst.setString(4, mf_date);
						pst.setString(5, expiry);
						pst.setInt(6, type);
						pst.setInt(7, category);
						pst.setInt(8, seg);
						pst.setInt(9, mf);
						pst.setInt(10, drug);
					
					 if (inputStream != null) {
				         // fetches input stream of the upload file for the blob column
				         pst.setBlob(11, inputStream);
				     }
						
						

						int chk = pst.executeUpdate();
						
						// print result
						if (chk == 0) {

							request.setAttribute("Msg", "fail");
							getServletContext().getRequestDispatcher("/Admin_login.jsp").forward(request, response);
						}
					
						getServletContext().getRequestDispatcher("/Admin_index.jsp").forward(request, response);
				
				
				
				
			}catch(Exception e)
			        {
				
			        }


		}
		}
		
		//////////////////////////
		// make orders Arraylist information 
		
		 ArrayList<medicine> medList = new ArrayList<medicine>();
		 
		try {
			medList =medDao.selectAllMedicine();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//////////////////////////
		// set attribute  
        request.setAttribute("medList", medList);
		
		
		//////////////////////////
		// Dispatcher - forward to list page
		getServletContext().getRequestDispatcher("/Admin_productList.jsp").forward(request, response);
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
