package com.ydu.biz.classes;



public class ClassListVO {
	public String classNo;
	public String week;
	public String time;
	

	private String openClass;
	private String classCode; // 과목 번호
	private String classTitle; // 과목 명 
	private String property; // 과목 속성
	private int classCredit; // 과목 학점
	private String major; // 전공
	public String getClassCode() {
		return classCode;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

	public int getClassCredit() {
		return classCredit;
	}
	public void setClassCredit(int classCredit) {
		this.classCredit = classCredit;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getOpenClass() {
		return openClass;
	}
	public void setOpenClass(String openClass) {
		this.openClass = openClass;
	}
}
