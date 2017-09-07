package com.ydu.biz.board;

import java.util.ArrayList;
import java.util.List;

import com.ydu.biz.board.BoardVO;



//BoardService
public interface BoardService {
	
	//메인에서 보여줄 미리보기 5개 공지사항 조회
	//List<BoardVO> prevNotice(BoardSearchVO vo);
	//메인에서 보여줄 미리보기 5개 학사안내 조회
	//List<BoardVO> prevLiterature(BoardSearchVO vo);
	
	
	
	
	//공지사항 조회 :게시판
	List<BoardVO> notice(BoardSearchVO vo);
	//학사안내 조회 :게시판
	List<BoardVO> literature(BoardSearchVO vo);
	//학사일정 조회: 달력
	
	
	
	//대학&대학교&부속기관
	BoardVO academics1(BoardVO vo);
	//대학&대학교&부속기관
	BoardVO academics2(BoardVO vo);
	//대학&대학교&부속기관
	BoardVO academics3(BoardVO vo);
	
	
	//벼룩시장
	BoardVO fleaMarket(BoardVO vo);
	//자유게시판
	BoardVO freeBoard(BoardVO vo);
	
	
	//FAQ
	BoardVO faq(BoardVO vo);
	
	
	//다건 삭제
	//void deleteBoardList(BoardSearchVO vo);
}