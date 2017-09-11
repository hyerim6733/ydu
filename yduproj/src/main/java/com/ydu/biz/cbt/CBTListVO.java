package com.ydu.biz.cbt;
/**
 * school/school
 * cbt_list : table
 * @author User
 *
 */
public class CBTListVO {
	private String cbtCode;
	private String openClass;
	private String cbtTitle;
	private String finalDate;
	private String note;
	private int limitTime;
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(int limitTime) {
		this.limitTime = limitTime;
	}
	public String getOpenClass() {
		return openClass;
	}
	public void setOpenClass(String openClass) {
		this.openClass = openClass;
	}
	public String getCbtCode() {
		return cbtCode;
	}
	public void setCbtCode(String cbtCode) {
		this.cbtCode = cbtCode;
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
