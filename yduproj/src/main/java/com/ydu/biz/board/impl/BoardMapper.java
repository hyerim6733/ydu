package com.ydu.biz.board.impl;

import java.util.List;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardVO;

public interface BoardMapper {
	
	//메인에서 보여줄 미리보기 5개 공지사항 조회
	List<BoardVO> prevNotice(BoardSearchVO vo);
	
	
	}
