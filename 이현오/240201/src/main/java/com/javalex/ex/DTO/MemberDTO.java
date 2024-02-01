package com.javalex.ex.DTO;

public class MemberDTO {
	// user 테이블 멤버변수 (필드)
	private String id;
	private String pw;
	private String name;
	private String hp;
	private String email;
	
	// guest 테이블 멤버변수 (필드)
	private String guestEmail;
	
	// guest 테이블 getter setter
	public String getGuestEmail() {
		return guestEmail;
	}
	public void setGuestEmail(String guestEmail) {
		this.guestEmail = guestEmail;
	}
	
	
	// user 테이블 getter setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
