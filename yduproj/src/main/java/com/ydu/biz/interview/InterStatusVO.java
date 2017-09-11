package com.ydu.biz.interview;

public class InterStatusVO {
	public String statusId;
	public String title;
	public String interDate;
	public String property;
	public String interId;
	
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
