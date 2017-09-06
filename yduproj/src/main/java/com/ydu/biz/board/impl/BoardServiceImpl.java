package com.ydu.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;



@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardDAO;
	
	
	//미리보기 5개 공지사항
	@Override
	public List<BoardVO> prevNotice(BoardSearchVO vo) {
		System.out.println("<<<<<<<<미리보기 5개  공지사항  조회성공");//확인용
		return boardDAO.prevNotice(vo);
		
	}
	

}
