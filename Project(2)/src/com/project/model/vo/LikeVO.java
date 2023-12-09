package com.project.model.vo;

public class LikeVO {

	private int bookId;
	private String memId;
	private int price;
	private String bookName;
	private String bookImage;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	
	@Override
	public String toString() {
		return "LikeVO [bookId=" + bookId + ", memId=" + memId + ", price=" + price + ", bookName=" + bookName
				+ ", bookImage=" + bookImage + "]";
	}
	
	public LikeVO(int bookId, String memId, int price, String bookName, String bookImage) {
		super();
		this.bookId = bookId;
		this.memId = memId;
		this.price = price;
		this.bookName = bookName;
		this.bookImage = bookImage;
	}
	
	public LikeVO() {
		super();
	}
	
	public LikeVO(String memId, int bookId) {
		super();
		this.memId = memId;	
		this.bookId = bookId;
	}
	
	
	
	
	
}
