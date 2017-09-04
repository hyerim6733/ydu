package com.ydu.biz.cbt;
/**
 * school/school
 * cbt_list : table
 * @author User
 *
 */
public class CBTListVO {
	private String cbtCode;
	private String classCode;
	private int professorCode;
	private String cbtTitle;
	private String finalDate;
	
	public String getCbtCode() {
		return cbtCode;
	}
	public void setCbtCode(String cbtCode) {
		this.cbtCode = cbtCode;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public int getProfessorCode() {
		return professorCode;
	}
	public void setProfessorCode(int professorCode) {
		this.professorCode = professorCode;
	}
	public String getCbtTitle() {
		return cbtTitle;
	}
	public void setCbtTitle(String cbtTitle) {
		this.cbtTitle = cbtTitle;
	}
	public String getFinalDate() {
		return finalDate;
	}
	public void setFinalDate(String finalDate) {
		this.finalDate = finalDate;
	}
	
	
	
}
