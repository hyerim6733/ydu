package com.ydu.biz.classes;

public class ClassStatusVO {
	private String statusId;
	private int classCode; //�닔媛뺤떊泥� 踰덊샇
	private String stCode; // �븰踰�
	private String openClass; // 媛쒖꽕怨쇰ぉ
	private String repeat; // �옱�닔媛�
	private int classGrade; //援먯닔媛� �븰�깮 �꽦�쟻 �엯�젰
	private String classTime;
	private String classTitle;
	private String property;
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
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
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	@Override
	public String toString() {
		return "ClassStatusVO [statusId=" + statusId + ", classCode=" + classCode + ", stCode=" + stCode
				+ ", openClass=" + openClass + ", repeat=" + repeat + ", classGrade=" + classGrade + ", classTime="
				+ classTime + ", classTitle=" + classTitle + ", property=" + property + ", getStatusId()="
				+ getStatusId() + ", getClassCode()=" + getClassCode() + ", getStCode()=" + getStCode()
				+ ", getOpenClass()=" + getOpenClass() + ", getRepeat()=" + getRepeat() + ", getClassGrade()="
				+ getClassGrade() + ", getClassTime()=" + getClassTime() + ", getClassTitle()=" + getClassTitle()
				+ ", getProperty()=" + getProperty() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
