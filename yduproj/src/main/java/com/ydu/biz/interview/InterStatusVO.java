package com.ydu.biz.interview;

public class InterStatusVO {
	private String statusId;
	private String title;
	private String interDate;
	private String property;
	private String interId;
	private String st_code;
	private String seq;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSt_code() {
		return st_code;
	}
	public void setSt_code(String st_code) {
		this.st_code = st_code;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInterDate() {
		return interDate;
	}
	public void setInterDate(String interDate) {
		this.interDate = interDate;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getInterId() {
		return interId;
	}
	public void setInterId(String interId) {
		this.interId = interId;
	}
	@Override
	public String toString() {
		return "InterStatusVO [statusId=" + statusId + ", title=" + title + ", property=" + property + ", interId="
				+ interId + "]";
	}
}
