package com.ydu.biz.main;

public class ProfessorVO {
	public String professorCode;
	public String id;
	public String email;
	public String name;
	public String birth;
	public String phone;
	public String hireDate;
	public String major;
	
	

	
	
	
	
	public String getProfessorCode() {
		return professorCode;
	}
	public void setProfessorCode(String professorCode) {
		this.professorCode = professorCode;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	@Override
	public String toString() {
		return "ProfessorVO [professorCode=" + professorCode + ", id=" + id + ", email=" + email + ", name=" + name
				+ ", birth=" + birth + ", phone=" + phone + ", hireDate=" + hireDate + ", major=" + major + "]";
	}
	
	
	
	
	
}
