package com.ydu.biz.cbt;

public class CBTComentVO {
	private String comentId;
	private String separation;
	private String userId;
	private String contents;
	private String name;
	public String getComentId() {
		return comentId;
	}
	public void setComentId(String comentId) {
		this.comentId = comentId;
	}
	public String getSeparation() {
		return separation;
	}
	public void setSeparation(String separation) {
		this.separation = separation;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ComentVO [comentId=" + comentId + ", separation=" + separation + ", userId=" + userId + ", contents="
				+ contents + "]";
	}
}
