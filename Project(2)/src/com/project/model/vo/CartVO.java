package com.project.model.vo;

public class CartVO {
	public int bookCnt;
	public int bookId;
	public String memId;
	public int price;
	public String bookName;
	
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
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "cartVO [bookCnt=" + bookCnt + ", bookId=" + bookId + ", memId=" + memId + ", price=" + price
				+ "]";
	}
	
	public CartVO(String memId, int bookId, int price, String bookName) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.memId = memId;
		this.price = price;
	}
	
	public CartVO(int bookId, String memId, int price, int bookCnt, String bookName) {
		super();
		this.bookId = bookId;
		this.memId = memId;
		this.price = price;
		this.bookCnt = bookCnt;
		this.bookName = bookName;
	}
	
	public CartVO() {
		super();
	}
	
	public CartVO(String memId, int bookId) {
		super();
		this.bookId = bookId;
		this.memId = memId;
	}
	

	
	
	
}
