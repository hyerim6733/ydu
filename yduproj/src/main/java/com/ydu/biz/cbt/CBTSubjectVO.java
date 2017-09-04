package com.ydu.biz.cbt;
/**
 * school/school
 * cbt_subject : table
 * @author User
 *
 */
public class CBTSubjectVO {
	private int cbtNo;
	private String question;
	private int rightAnswer;
	private String[] ex;
	private String cbtCode;
	
	public int getCbtNo() {
		return cbtNo;
	}
	public void setCbtNo(int cbtNo) {
		this.cbtNo = cbtNo;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(int rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public String[] getEx() {
		return ex;
	}
	public void setEx(String[] ex) {
		this.ex = ex;
	}
	public String getCbtCode() {
		return cbtCode;
	}
	public void setCbtCode(String cbtCode) {
		this.cbtCode = cbtCode;
	}
	
	
	
	
	
}
