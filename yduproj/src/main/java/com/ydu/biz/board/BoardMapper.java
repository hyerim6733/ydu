package com.ydu.biz.board;

import java.util.List;

import com.ydu.ydapp.biz.board.BoardSearchVO;
import com.ydu.ydapp.biz.board.BoardVO;

public interface BoardMapper {
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
}
