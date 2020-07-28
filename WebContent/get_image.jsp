<%-- 
    Document   : get_image
    Created on : 22 Feb, 2020, 10:03:09 PM
    Author     : vivek
--%>


<%@page import="java.sql.*"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
 

 
try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_medicine","root","");
	
    PreparedStatement ps = con.prepareStatement("select * from medicine where med_id=?");
    ps.setString(1,id);
    ResultSet rs = ps.executeQuery();

 
    if(rs.next()){
        Blob blob = rs.getBlob("med_image");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
 
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }
}
catch(Exception e){
    e.printStackTrace();
}   


%>