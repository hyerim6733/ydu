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
	//미리보기 5개 학사안내
	//미리보기 5개 학교일정
	
	//공지사항
	@Override
	public List<BoardVO> notice(BoardSearchVO vo) {
		System.out.println("=====notice");//확인용
		return boardDAO.notice(vo);
	}
	//학사안내
	@Override
	public List<BoardVO> literature(BoardSearchVO vo) {
		// TODO Auto-generated method stub
		System.out.println("=====literature");//확인용
		return boardDAO.literature(vo);
	}
	//대학 -> 대학별 학과별 정리할 페이지
	@Override
	public BoardVO academics1(BoardVO vo) {
		System.out.println("=====academics1");//확인용
		return boardDAO.academics1(vo);
	}
	@Override
	public BoardVO academics2(BoardVO vo) {
		System.out.println("=====academics2");//확인용
		return boardDAO.academics2(vo);
	}
	@Override
	public BoardVO academics3(BoardVO vo) {
		System.out.println("=====academics3");//확인용
		return boardDAO.academics3(vo);
	}
	//벼룩시장&자유게시판
	@Override
	public BoardVO fleaMarket(BoardVO vo) {
		System.out.println("=====fleaMarket");//확인용
		return boardDAO.fleaMarket(vo);
	}
	@Override
	public BoardVO freeBoard(BoardVO vo) {
		System.out.println("=====freeBoard");//확인용
		return boardDAO.freeBoard(vo);
	}
	//FAQ
	@Override
	public BoardVO faq(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	

}
