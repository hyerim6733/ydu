package com.ydu.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;
import com.ydu.ydapp.mapper.BoardMapper;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardDAO;
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
		System.out.println("등록 : " + vo.getBoardId());//확인용
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
		System.out.println("업데이트");//확인용
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
		System.out.println("삭제");//확인용
		
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("조회성공");//확인용
		return boardDAO.getBoard(vo);
		
	}

	@Override
	public List<BoardVO> getBoardList(BoardSearchVO vo) {
		System.out.println("리스트 조회성공");//확인용
		return boardDAO.getBoardList(vo);
		
	}

}
