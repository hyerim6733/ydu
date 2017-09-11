package com.ydu.biz.main;

public class StudentVO {
	public String student_code;
	public String birth;
	public String name;
	public String major;
	public String phone;
	public String entrance_date;
	public String current_credit;
	public String grade;
	public String total_credit;
	public String id;
	public String getStudent_code() {
		return student_code;
	}
	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEntrance_date() {
		return entrance_date;
	}
	public void setEntrance_date(String entrance_date) {
		this.entrance_date = entrance_date;
	}
	public String getCurrent_credit() {
		return current_credit;
	}
	public void setCurrent_credit(String current_credit) {
		this.current_credit = current_credit;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTotal_credit() {
		return total_credit;
	}
	public void setTotal_credit(String total_credit) {
		this.total_credit = total_credit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "StudentVO [student_code=" + student_code + ", name=" + name + ", major=" + major + ", id=" + id + "]";
	}
	
}
