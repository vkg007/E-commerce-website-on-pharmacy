package com.medicine.model;
public class Admin {
String email,pswrd,fname,lname,date;
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
int adminId;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPswrd() {
	return pswrd;
}
public void setPswrd(String pswrd) {
	this.pswrd = pswrd;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public int getAdminId() {
	return adminId;
}
public void setAdminId(int adminId) {
	this.adminId = adminId;
}
}
