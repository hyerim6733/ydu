package com.ydu.biz.main;

public class LoginVO {
	public String userid;
	private String userpw;
	private String separation;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	
	public String getSeparation() {
		return separation;
	}
	public void setSeparation(String separation) {
		this.separation = separation;
	}
	@Override
	public String toString() {
		return "LoginVO [userid=" + userid + ", userpw=" + userpw + ", separation=" + separation + "]";
	}
	
}
