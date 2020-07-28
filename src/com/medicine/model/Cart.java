package com.medicine.model;
public class Cart {

	private int cart_id;
	private int cart_quantity;
	private String cart_med_name;
	private int cart_med_id;
	private String customerId;
	
	private float price;
	private float discount;
    public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public String getCart_med_name() {
		return cart_med_name;
	}
	public void setCart_med_name(String cart_med_name) {
		this.cart_med_name = cart_med_name;
	}
	public int getCart_med_id() {
		return cart_med_id;
	}
	public void setCart_med_id(int cart_med_id) {
		this.cart_med_id = cart_med_id;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	
	
	
	
}
