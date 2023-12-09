package com.project.model.vo;

import java.sql.Date;

public class OrderVO {

	public String orderId;
	//public static String orderId;
	public int totalPrice;
	public Date orderdate;
	public Date dlvydate;
	public String memId;
	public String payment;
	public int point;
	public String cancel;
	public int totalCnt;
	public String rcvPhone;
	public String rcvAddress;
	public String rcvName;
	
	public OrderVO(String orderId, int totalPrice, Date orderdate, Date dlvydate, String memId, String payment,
			int totalCnt, String rcvPhone, String rcvAddress, String rcvName) {
		super();
		this.orderId = orderId;
		this.totalPrice = totalPrice;
		this.orderdate = orderdate;
		this.dlvydate = dlvydate;
		this.memId = memId;
		this.payment = payment;
		this.totalCnt = totalCnt;
		this.rcvPhone = rcvPhone;
		this.rcvAddress = rcvAddress;
		this.rcvName = rcvName;
	}

	public OrderVO() {
		super();
	}

//	public static String getOrderId() {
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public Date getDlvydate() {
		return dlvydate;
	}

	public void setDlvydate(Date dlvydate) {
		this.dlvydate = dlvydate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public String getRcvPhone() {
		return rcvPhone;
	}

	public void setRcvPhone(String rcvPhone) {
		this.rcvPhone = rcvPhone;
	}

	public String getRcvAddress() {
		return rcvAddress;
	}

	public void setRcvAddress(String rcvAddress) {
		this.rcvAddress = rcvAddress;
	}

	public String getRcvName() {
		return rcvName;
	}

	public void setRcvName(String rcvName) {
		this.rcvName = rcvName;
	}

	public OrderVO(int totalPrice, String memId, String payment, int totalCnt, String rcvPhone, String rcvAddress,
			String rcvName) {
		super();
		this.totalPrice = totalPrice;
		this.memId = memId;
		this.payment = payment;
		this.totalCnt = totalCnt;
		this.rcvPhone = rcvPhone;
		this.rcvAddress = rcvAddress;
		this.rcvName = rcvName;
	}

	
	
	
}
