package com.ydu.biz.board;

import java.util.ArrayList;
import java.util.List;



//BoardService
public interface BoardService {
	
	//메인에서 보여줄 미리보기 5개 공지사항 조회
	List<BoardVO> prevNotice(BoardSearchVO vo);
	
	//학사안내 조회 :게시판
	
	//학사일정 조회: 달력
	
	//다건 삭제
	//void deleteBoardList(BoardSearchVO vo);
}