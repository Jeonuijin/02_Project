package com.project.model.vo;

import java.sql.Date;

public class BookVO {
	private int bookId;
	private String bookName;
	private int price;
	private String publisher;
	private String pubDate;
	private String author;
	private double gradeAvg;
	private int bookCnt;
	private int orderCnt;
	private String details;
	private String bookImage;
	private String category;
	private String bookRealImage;
	private String status;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public BookVO() {
		super();
	}
	public BookVO(String bookImage, String bookRealImage) {
		super();
		this.bookImage = bookImage;
		this.bookRealImage = bookRealImage;
	}
	public String getBookRealImage() {
		return bookRealImage;
	}
	public void setBookRealImage(String bookRealImage) {
		this.bookRealImage = bookRealImage;
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
	public void setBookName(String bookname) {
		this.bookName = bookname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getGradeAvg() {
		return gradeAvg;
	}
	public void setGradeAvg(double grade_avg) {
		this.gradeAvg = grade_avg;
	}
	public int getBookCnt() {
		return bookCnt;
	}
	public void setBookCnt(int book_cnt) {
		this.bookCnt = book_cnt;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int order_cnt) {
		this.orderCnt = order_cnt;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String book_image) {
		this.bookImage = book_image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "BookVO [bookId=" + bookId + ", bookName=" + bookName + ", price=" + price + ", publisher=" + publisher
				+ ", pubDate=" + pubDate + ", author=" + author + ", gradeAvg=" + gradeAvg + ", bookCnt=" + bookCnt
				+ ", orderCnt=" + orderCnt + ", details=" + details + ", bookImage=" + bookImage + ", category="
				+ category + ", bookRealImage=" + bookRealImage + ", status=" + status + "]";
	}
	

	public BookVO(int bookId, String bookName, int price, String publisher, String pubDate, String author, double gradeAvg,
			int bookCnt, int orderCnt, String details, String bookImage, String category) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.price = price;
		this.publisher = publisher;
		this.pubDate = pubDate;
		this.author = author;
		this.gradeAvg = gradeAvg;
		this.bookCnt = bookCnt;
		this.orderCnt = orderCnt;
		this.details = details;
		this.bookImage = bookImage;
		this.category = category;
	}
	
	public BookVO(String bookName, int price) {
		super();
		this.bookName = bookName;
		this.price = price;
	}
	
	public BookVO(int bookId, String bookName, int price) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.price = price;
	}
	
	
	
	
}