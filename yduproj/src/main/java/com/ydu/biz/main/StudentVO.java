package com.ydu.biz.main;

public class StudentVO {
	public String studentCode;
	public String birth;
	public String name;
	public String major;
	public String phone;
	public String entranceDate;
	public String currentCredit;
	public String grade;
	public String totalScore;
	public String id;
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
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
	public String getEntranceDate() {
		return entranceDate;
	}
	public void setEntranceDate(String entranceDate) {
		this.entranceDate = entranceDate;
	}
	public String getCurrentCredit() {
		return currentCredit;
	}
	public void setCurrentCredit(String currentCredit) {
		this.currentCredit = currentCredit;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "StudentVO [studentCode=" + studentCode + ", birth=" + birth + ", name=" + name + ", major=" + major
				+ ", phone=" + phone + ", entranceDate=" + entranceDate + ", currentCredit=" + currentCredit
				+ ", grade=" + grade + ", totalScore=" + totalScore + ", id=" + id + ", getStudentCode()="
				+ getStudentCode() + ", getBirth()=" + getBirth() + ", getName()=" + getName() + ", getMajor()="
				+ getMajor() + ", getPhone()=" + getPhone() + ", getEntranceDate()=" + getEntranceDate()
				+ ", getCurrentCredit()=" + getCurrentCredit() + ", getGrade()=" + getGrade() + ", getTotalScore()="
				+ getTotalScore() + ", getId()=" + getId() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
}
