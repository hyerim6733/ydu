package com.ydu.biz.classes;

public class NewClassVO {
	private String openClass; // 개설 과목 코드
	private String openYear; // 개설 연도
	private int profCode; // 교수 코드
	private String classTime; // 강의 시간
	private int studentLimit; // 수강 정원
	private String openSemester; // 개설 학기
	private String classRoom; // 강의실
	private String classCode; //과목 코드
	
	
	public int getProfCode() {
		return profCode;
	}
	public void setProfCode(int profCode) {
		this.profCode = profCode;
	}
	public String getOpenSemester() {
		return openSemester;
	}
	public void setOpenSemester(String openSemester) {
		this.openSemester = openSemester;
	}
	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getOpenClass() {
		return openClass;
	}
	public void setOpenClass(String openClass) {
		this.openClass = openClass;
	}
	public String getOpenYear() {
		return openYear;
	}
	public void setOpenYear(String openYear) {
		this.openYear = openYear;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public int getStudentLimit() {
		return studentLimit;
	}
	public void setStudentLimit(int studentLimit) {
		this.studentLimit = studentLimit;
	}
	
	
}
