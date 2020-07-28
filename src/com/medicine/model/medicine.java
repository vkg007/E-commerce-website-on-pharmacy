package com.medicine.model;

public class medicine {
	String name,type_name,drug_name,mf_name,seg_name,mf_date,expiry,drug_desc,cat_name,mf_add;
	float price,dis;
	int id,type_id,cat_id,mf_id,drug_id,seg_id;
	
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public int getMf_id() {
		return mf_id;
	}
	public void setMf_id(int mf_id) {
		this.mf_id = mf_id;
	}
	public int getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(int drug_id) {
		this.drug_id = drug_id;
	}
	public int getSeg_id() {
		return seg_id;
	}
	public void setSeg_id(int seg_id) {
		this.seg_id = seg_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getMf_add() {
		return mf_add;
	}
	public void setMf_add(String mf_add) {
		this.mf_add = mf_add;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public String getMf_name() {
		return mf_name;
	}
	public void setMf_name(String mf_name) {
		this.mf_name = mf_name;
	}
	public String getSeg_name() {
		return seg_name;
	}
	public void setSeg_name(String seg_name) {
		this.seg_name = seg_name;
	}
	public String getMf_date() {
		return mf_date;
	}
	public void setMf_date(String mf_date) {
		this.mf_date = mf_date;
	}
	public String getExpiry() {
		return expiry;
	}
	public void setExpiry(String expiry) {
		this.expiry = expiry;
	}
	public String getDrug_desc() {
		return drug_desc;
	}
	public void setDrug_desc(String drug_desc) {
		this.drug_desc = drug_desc;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDis() {
		return dis;
	}
	public void setDis(float dis) {
		this.dis = dis;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
