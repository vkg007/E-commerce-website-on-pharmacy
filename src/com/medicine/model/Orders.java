package com.medicine.model;

/**
 * ---------------------------------------------
 * 
 * @author JIEUN KWON (991447941)
 * 
 *         TASK : Assignment 3 MVC Modeling - Shoe Product Ordering System
 * 
 *         created Date : Nov 26, 2018 modified Date : Nov 26, 2018
 *         ---------------------------------------------
 *
 *         Page Task : Orders Bean
 *
 */

public class Orders {

	private int orderId;
	private int itemId;
	private String itemName;
	private String customerId;
	private float discount;
	private int quantity;
	private double price;
	private String orderStatus;
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	
	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

}
