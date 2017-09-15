package com.ydu.biz.board;




//BoardSearchVO  검색(조회)

public class BoardSearchVO {
	
	private String boardCode;//게시판 구분  
	private String category;//게시판 내에서 소분류
	//private Integer[] seqList; //다건 삭제 배열 추가
	//board-mapping.xml ->getBoardList 에서 사용한거 사용
	private String searchCondition;
	private String searchKeyword;
	
	private String orderColumn;
	private String orderAsc;
	
	private Integer first;
	private Integer last;
	
	
	
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderAsc() {
		return orderAsc;
	}
	public void setOrderAsc(String orderAsc) {
		this.orderAsc = orderAsc;
	}
	public Integer getFirst() {
		return first;
	}
	public void setFirst(Integer first) {
		this.first = first;
	}
	public Integer getLast() {
		return last;
	}
	public void setLast(Integer last) {
		this.last = last;
	}
	
	
/*	public Integer[] getSeqList() {
		return seqList;
	}
	public void setSeqList(Integer[] seqList) {
		this.seqList = seqList;
	}*/
	

}
