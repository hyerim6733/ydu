package com.ydu.ydapp.biz.board;

import java.util.Date;

/*-- 공지사항, 학교행사, 자유게시판, 벼룩시장*/
public class BoardVO  {
	
	private int boardCode; //공지사항, 학교행사, 자유게시판, 벼룩시장
	private int boardId; //게시판 글 등록순서
	private String title;// 글 제목
	private Date writeDate; //최초 등록일
	private Date editDate;// 수정 날짜 (최신으로 갱신)
	private String category; //게시판 내에서 구분(교내, 교외 , 등록금) 게시판별 (벼룩시장, 공지사항)
	private String writer;  //글쓴이
	private String content; //글 내용
	//private int cnt; //페이지 보여줄려면 필요할거 같은데 
	
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getEditDate() {
		return editDate;
	}
	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [boardCode=" + boardCode + ", boardId=" + boardId + ", title=" + title + ", writeDate="
				+ writeDate + ", editDate=" + editDate + ", category=" + category + ", writer=" + writer + ", content="
				+ content + "]";
	}
	
	
	
	
	
	

}
