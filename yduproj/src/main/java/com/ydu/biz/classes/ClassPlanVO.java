package com.ydu.biz.classes;

public class ClassPlanVO {
	
	private String openClass; // 개설 과목
	private String classContents; // 수업 간략 소개
	private String project; // 과제
	private String[] planWeek = new String [15]; // 주차 계획(1주~16주)
	public String getOpenClass() {
		return openClass;
	}
	public void setOpenClass(String openClass) {
		this.openClass = openClass;
	}
	public String getClassContents() {
		return classContents;
	}
	public void setClassContents(String classContents) {
		this.classContents = classContents;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String[] getPlanWeek() { 
		return planWeek;
	}
	public void setPlanWeek(String[] planWeek) {
		this.planWeek = planWeek;
	}
	
	
}
