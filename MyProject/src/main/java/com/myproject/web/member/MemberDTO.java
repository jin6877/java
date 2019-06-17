package com.myproject.web.member;

public class MemberDTO {

	private int idx;
	private String name;
	private String pw;
	private String email;
		
	@Override
	public String toString() {
		return "MemberDTO [idx=" + idx + ", name=" + name + ", pw=" + pw + ", email=" + email
				 + "]";
	}
			
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
