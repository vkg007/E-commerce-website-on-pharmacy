package com.medicine.web;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.medicine.dao.DBConnector;
import com.medicine.dao.medicineDAO;
import com.medicine.model.medicine;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProductController")
@MultipartConfig(maxFileSize = 16177215)
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode=request.getParameter("mode");
		String view=request.getParameter("view");
		if (mode != null && !mode.isEmpty()) {

		if(mode.equals("insert"))
		{
			
		
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
				
				//PrintWriter out = response.getWriter();
				//out.println(name+" "+price+" "+discount+" "+mf_date+" "+expiry+" "+type+" "+category+" "+seg+" "+mf+" "+drug);
			try {
				String insertQuery = "insert into medicine "
						+ "(med_name,med_price,med_discount,med_mf_date,med_expiry,med_medtype,med_category,med_drugname,med_manufacturer,med_section,med_image) values (?,?,?,?,?,?,?,?,?,?,?)";
				Connection con=DBConnector.getConnection();
				PreparedStatement pst;
				
				pst = con.prepareStatement(insertQuery);
				PrintWriter out = response.getWriter();
				out.println(name+" "+price+" "+discount+" "+mf_date+" "+expiry+" "+type+" "+category+" "+seg+" "+mf+" "+drug);

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
			//out.println(name+" "+price+" "+discount+" "+mf_date+" "+expiry+" "+type+" "+category+" "+seg+" "+mf+" "+drug+" "+image);
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
			}
			catch(Exception ex)
			{
			ex.printStackTrace();
			}
			
		   }
		else if(mode.equals("addtype"))
		{
			String type=request.getParameter("type_name");
			try
			{
				String sql="insert into medicine_type(medtype_name) values (?)";
				Connection con=DBConnector.getConnection();
				PreparedStatement pst;
				pst=con.prepareStatement(sql);
				pst.setString(1,type);
int chk = pst.executeUpdate();
				
				// print result
				if (chk == 0) {

					request.setAttribute("Msg", "fail");
					
				}
			
				
			}
			catch(Exception e)
			{
				
			}
			
		}
		else if(mode.equals("addCAT"))
		{
			String cat=request.getParameter("cat");
			
			
			try
			{
				String sql="insert into category(category_name) values (?)";
				Connection con=DBConnector.getConnection();
				PreparedStatement pst;
				pst=con.prepareStatement(sql);
				pst.setString(1,cat);
                int chk = pst.executeUpdate();
				
				// print result
				if (chk == 0) {

					request.setAttribute("Msg", "fail");
					
				}
				
				
			}
			catch(Exception e)
			{
				
			}
		}
		else if(mode.equals("addDRUG"))
		{
			String drug=request.getParameter("drug_name");
			String des=request.getParameter("desc");
			
			try
			{
				String sql="insert into composition(comp_drug_name,comp_description) values (?,?)";
				Connection con=DBConnector.getConnection();
				PreparedStatement pst;
				pst=con.prepareStatement(sql);
				pst.setString(1,drug);
				pst.setString(2,des);
           int chk = pst.executeUpdate();
				
				// print result
				if (chk == 0) {

					request.setAttribute("Msg", "fail");
					
				}
				
				
				
			}
			catch(Exception e)
			{
				
			}
		}
		else if(mode.equals("addSEG"))
		{
			String seg=request.getParameter("seg2");
			
			try
			{
				String sql="insert into segments (Seg_name) values (?)";
				Connection con=DBConnector.getConnection();
				PreparedStatement pst;
				pst=con.prepareStatement(sql);
				pst.setString(1,seg);
int chk = pst.executeUpdate();
				
				// print result
				if (chk == 0) {

					request.setAttribute("Msg", "fail");
					
				}
			
				
			}
			catch(Exception e)
			{
				
			}
		}
		else if(mode.equals("addMF"))
		{
			String name=request.getParameter("mf_name");
			int id=Integer.parseInt(request.getParameter("mf_id"));
			String add=request.getParameter("mf_address");
			
			try
			{
				String sql="insert into manufacturer(mf_name,mf_license_no,mf_address) values (?,?,?)";
				Connection con=DBConnector.getConnection();
				PreparedStatement pst;
				pst=con.prepareStatement(sql);
				pst.setString(1,name);
				pst.setInt(2,id);
				pst.setString(3,add);
int chk = pst.executeUpdate();
				
				// print result
				if (chk == 0) {

					request.setAttribute("Msg", "fail");
					
				}
			
				
			}
			catch(Exception e)
			{
				
			}
		}
		}
			
			
		
				medicineDAO medDao=new medicineDAO();
		ArrayList<medicine> medtypeList = new ArrayList<medicine>();
		try {
			medtypeList=medDao.fetchtype();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<medicine> medcatList = new ArrayList<medicine>();
		try {
			medcatList=medDao.fetchcategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<medicine> medsegList = new ArrayList<medicine>();
		try {
			medsegList=medDao.fetchsegment();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<medicine> meddrugList = new ArrayList<medicine>();
		try {
			meddrugList=medDao.fetchcomposition();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<medicine> medmfList = new ArrayList<medicine>();
		try {
			medmfList=medDao.fetchmanufacturer();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("medtype", medtypeList);
		request.setAttribute("medcat", medcatList);
		request.setAttribute("medseg", medsegList);
		request.setAttribute("meddrug", meddrugList);
		request.setAttribute("medmf", medmfList);
		if (view != null && !view.isEmpty()) {

			if(view.equals("mf"))
			{
				getServletContext().getRequestDispatcher("/View_Mf.jsp").forward(request, response);
			}
			
}
		else
		getServletContext().getRequestDispatcher("/Admin_Addproduct.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
