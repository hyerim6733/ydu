package com.ydu.ydapp.biz.board;

import java.util.List;


public interface BoardService {
	//등록
	void insertBoard(BoardVO vo);
	//수정
	void updateBoard(BoardVO vo);
	//삭제
	void deleteBoard(BoardVO vo);
	//상세조회
	BoardVO getBoard(BoardVO vo);
	//목록조회
	List<BoardVO> getBoardList(BoardSearchVO vo);
	//다건 삭제
	//void deleteBoardList(BoardSearchVO vo);
}