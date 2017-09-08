package com.ydu.biz.classes;

public class ClassStatusVO {
	
	private int classNo; //수강신청 번호
	private String stCode; // 학번
	private String openClass; // 개설과목
	private String repeat; // 재수강
	private int classGrade; //교수가 학생 성적 입력
	
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getStCode() {
		return stCode;
	}
	public void setStCode(String stCode) {
		this.stCode = stCode;
	}
	public String getOpenClass() {
		return openClass;
	}
	public void setOpenClass(String openClass) {
		this.openClass = openClass;
	}
	public String getRepeat() {
		return repeat;
	}
	public void setRepeat(String repeat) {
		this.repeat = repeat;
	}
	public int getClassGrade() {
		return classGrade;
	}
	public void setClassGrade(int classGrade) {
		this.classGrade = classGrade;
	}

	
	
}
