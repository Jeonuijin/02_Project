package com.project.model.vo;

public class NoticeBoardVO {

	private String nbIdx;
	private String type;
	private String title;
	private String contents;
	private String createDat;
	private String rnum;
	
	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public NoticeBoardVO(String nbIdx) {
		this.nbIdx = nbIdx;
	}

	public NoticeBoardVO(String type, String title, String contents) {
		
		this.type = type;
		this.title = title;
		this.contents = contents;
	}

	public NoticeBoardVO(String nbIdx, String type, String title, String contents) {
		
		this.nbIdx = nbIdx;
		this.type = type;
		this.title = title;
		this.contents = contents;
	}

	public NoticeBoardVO(String nbIdx, String type, String title, String contents, String createDat) {
		this.nbIdx = nbIdx;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.createDat = createDat;
	}

	public NoticeBoardVO(String nbIdx, String type, String title, String contents, String createDat, String rnum) {
		super();
		this.nbIdx = nbIdx;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.createDat = createDat;
		this.rnum = rnum;
	}

	public String getNbIdx() {
		return nbIdx;
	}

	public void setNbIdx(String nbIdx) {
		this.nbIdx = nbIdx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCreateDat() {
		return createDat;
	}

	public void setCreateDat(String createDat) {
		this.createDat = createDat;
	}
	
	
	@Override
	public String toString() {
		return "NoticeBoardVO [nbIdx=" + nbIdx + ", type=" + type + ", title=" + title + ", contents=" + contents
				+ ", createDat=" + createDat + ", rnum=" + rnum + "]";
	}
	
	
}
