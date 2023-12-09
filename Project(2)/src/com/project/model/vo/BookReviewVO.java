package com.project.model.vo;

import java.sql.Date;

public class BookReviewVO {
	private int reviewId;
	private String reviewContent;
	private int grade;
	private int bookId;
	private String memId;
	private Date regDate;

	public Date getRegdate() {
		return regDate;
	}
	public void setRegdate(Date regdate) {
		this.regDate = regdate;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
	
	
	@Override
	public String toString() {
		return "BookReviewVO [reviewId=" + reviewId + ", reviewContent=" + reviewContent + ", grade=" + grade
				+ ", bookId=" + bookId + ", memId=" + memId + ", regdate=" + regDate + "]";
	}
	
}