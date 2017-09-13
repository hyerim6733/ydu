package com.ydu.biz.board.impl;

import java.util.List;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardVO;



public interface BoardMapper {
	
//미리보기
	//메인에서 보여줄 미리보기 5개 공지사항 조회
	//List<BoardVO> prevNotice(BoardSearchVO vo);
	//메인에서 보여줄 미리보기 5개 학교일정 조회
	//메인에서 보여줄 벼룩시장 5개
	//메인에서 보여줄 자유게시판 5개 
	//메인에서 보여줄 FAQ 
	

//공지사항 //b10//b11//b12//b13//b14//b15=====조회까지 성공
	List<BoardVO> notice(BoardSearchVO vo);	 //b1
	List<BoardVO> noticeGen(BoardSearchVO vo); 
	List<BoardVO> noticeLit(BoardSearchVO vo); 
	List<BoardVO> noticeEmp(BoardSearchVO vo); 
	List<BoardVO> noticeSch(BoardSearchVO vo); 
	List<BoardVO> noticeVol(BoardSearchVO vo); 
	List<BoardVO> noticeEve(BoardSearchVO vo); 
	//공지 상세보기
	//BoardVO getNotice(BoardVO vo);
	//공지 등록 만들어야 함 
	//BoardVO insertNotice(BoardVO vo);
		
		
//학교일정 academicCalendar
	BoardVO academicCalendar(BoardVO vo);
		
		
//학교안내
	BoardVO academics1(BoardVO vo);
	BoardVO academics2(BoardVO vo);
	BoardVO academics3(BoardVO vo);

		
//벼룩시장//[팝니다]//[삽니다]
	List<BoardVO> fleaMarket(BoardSearchVO vo);	
	List<BoardVO> fleaMarketSell(BoardSearchVO vo);
	List<BoardVO> fleaMarketBuy(BoardSearchVO vo);
	//벼룩시장 상세보기
	//BoardVO getFleaMarket(BoardVO vo);
	//벼룩시장 등록
	//BoardVO insertFleaMarket(BoardVO vo);
		
		

//자유게시판
	List<BoardVO> freeBoard(BoardSearchVO vo);
	//자유게시판 상세보기
	//BoardVO getFreeBoard(BoardVO vo);
	//자유게시판 등록
	//BoardVO insertFreeBoard(BoardVO vo);
		
//FAQ
	BoardVO faq(BoardVO vo);
		
	

	//다건 삭제
	//void deleteBoardList(BoardSearchVO vo);
}