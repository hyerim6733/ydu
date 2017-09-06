package com.ydu.biz.classes;

public class ClassListVO {
	
	private String classCode; // 과목 번호
	private String classTitle; // 과목 명 
	private String property; // 과목 속성
	private String classCredit; // 과목 학점
	private String major; // 전공
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getClassCredit() {
		return classCredit;
	}
	public void setClassCredit(String classCredit) {
		this.classCredit = classCredit;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
	
}
