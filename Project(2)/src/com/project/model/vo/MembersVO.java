package com.project.model.vo;

public class MembersVO {
	private String memId;
	private String memPw;
	private String name;
	private String address;
	private String phone;
	private String birth;
	private String email;
	private String statement;
	
	public MembersVO() {
	}
	public MembersVO(String memId, String memPw) {
		this.memId = memId;
		this.memPw = memPw;
	}
	public MembersVO(String name, String phone, String birth, String email) {
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
	}
	public MembersVO(String memId, String memPw, String name, String address, String phone, String birth,
			String email) {
		this.memId = memId;
		this.memPw = memPw;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
	}
	public MembersVO(String memId, String memPw, String name, String address, String phone, String birth, String email,
			String statement) {
		this.memId = memId;
		this.memPw = memPw;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.statement = statement;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	
	@Override
	public String toString() {
		return "MembersVO [memId=" + memId + ", memPw=" + memPw + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", birth=" + birth + ", email=" + email + ", statement=" + statement + "]";
	}
	
}
