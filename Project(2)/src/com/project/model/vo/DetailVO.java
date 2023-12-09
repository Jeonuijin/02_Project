package com.project.model.vo;

public class DetailVO {
	private int detailNum;
	private int orderId;
	private String memId;
	private int bookId;
	private String bookName;
	private int bookCnt;
	private int price;
	
	public int getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(int detailNum) {
		this.detailNum = detailNum;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBookCnt() {
		return bookCnt;
	}
	public void setBookCnt(int bookCnt) {
		this.bookCnt = bookCnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public DetailVO(int detailNum, int orderId, String memId, int bookId, String bookName, int bookCnt, int price) {
		super();
		this.detailNum = detailNum;
		this.orderId = orderId;
		this.memId = memId;
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookCnt = bookCnt;
		this.price = price;
	}
	
	public DetailVO(int orderId, String memId, int bookId, String bookName, int bookCnt, int price) {
		super();
		this.orderId = orderId;
		this.memId = memId;
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookCnt = bookCnt;
		this.price = price;
	}
	public DetailVO() {
		super();
	}
	@Override
	public String toString() {
		return "DetailVO [detailNum=" + detailNum + ", orderId=" + orderId + ", memId=" + memId + ", bookId=" + bookId
				+ ", bookName=" + bookName + ", bookCnt=" + bookCnt + ", price=" + price + "]";
	}
	
	
	
	
}
