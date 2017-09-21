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
	
	//미리보기 각 5개 공지사항 (예시. 동국대학교) 
	//미리보기 5개 학교일정
	//미리보기 5개 벼룩시장
	//미리보기 5개 자유게시판
	//미리보기 FAQ
	
//공지사항	
	

	
	@Override
	public List<BoardVO> notice(BoardSearchVO vo) {
		return boardDAO.notice(vo);
	}
	@Override
	public int total(BoardSearchVO vo) {
		return boardDAO.total(vo);
	}
	
	
	
	
	
	@Override
	public List<BoardVO> noticeGen(BoardSearchVO vo) {
		System.out.println("b10 일반공지=====noticeGen");//확인용
		return boardDAO.noticeGen(vo);
	}
	@Override
	public List<BoardVO> noticeLit(BoardSearchVO vo) {
		System.out.println("b11 학사공지=====noticeLit");//확인용
		return boardDAO.noticeLit(vo);
	}
	@Override
	public List<BoardVO> noticeEmp(BoardSearchVO vo) {
		System.out.println("b12 취업공지=====noticeEmp");//확인용
		return boardDAO.noticeEmp(vo);
	}
	@Override
	public List<BoardVO> noticeSch(BoardSearchVO vo) {
		System.out.println("b13 장학공지=====noticeSch");//확인용
		return boardDAO.noticeSch(vo);
	}
	@Override
	public List<BoardVO> noticeVol(BoardSearchVO vo) {
		System.out.println("b14 봉사공지=====noticeVol");//확인용
		return boardDAO.noticeVol(vo);
	}
	
//b15 학술/행사	
	@Override
	public List<BoardVO> noticeEve(BoardSearchVO vo) {
		return boardDAO.noticeEve(vo);
	}
	@Override
	public int totalEve(BoardSearchVO vo) {
		return boardDAO.totalEve(vo);
	}
	
	
	
	
	
	
	
	
	@Override
	public void insertNotice(BoardVO vo) {
		boardDAO.insertNotice(vo);
		}
	@Override
	public void updateNotice(BoardVO vo) {
		boardDAO.updateNotice(vo);
		}
	@Override
	public BoardVO detailNotice(BoardVO vo) {
		return boardDAO.detailNotice(vo);
	}
	

////////////////////////////////////////////////////////////////
//학교일정b2
	@Override
	public BoardVO academicCalendar(BoardVO vo) {
		System.out.println("=====academicCalendar");//확인용
		return boardDAO.academicCalendar(vo);
	}	
	
	
	
///////////////////////////////////////////////////////////////	
//학교안내 b3
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
	
	
///////////////////////////////////////////////////////////////		
//벼룩시장 b4
	@Override
	public List<BoardVO> fleaMarket(BoardSearchVO vo) {
		System.out.println("==벼룩시장===fleaMarket");//확인용
		return boardDAO.fleaMarket(vo);
	}
	@Override
	public List<BoardVO> fleaMarketSell(BoardSearchVO vo) {
		System.out.println("벼룩시장 팝니다===fleaMarketSell===");//확인용
		return boardDAO.fleaMarketSell(vo);
	}
	@Override
	public List<BoardVO> fleaMarketBuy(BoardSearchVO vo) {
		System.out.println("벼룩시장 삽니다===fleaMarketBuy===");//확인용
		return boardDAO.fleaMarketBuy(vo);
	}	
	/*@Override
	public void insertFleaMarket(BoardVO vo) {
		boardDAO.insertFleaMarket(vo);
		System.out.println("벼룩시장등록");
	}
	*/
	/*@Override
	public void updateFleaMarket(BoardVO vo) {
		boardDAO.updateNotice(vo);
		System.out.println("공지수정");
	}*/
	
	
	
///////////////////////////////////////////////////////////////			
	
	
//자유게시판 b5
	@Override
	public List<BoardVO> freeBoard(BoardSearchVO vo) {
		System.out.println("==자유게시판===freeBoard");//확인용
		return boardDAO.freeBoard(vo);
	}
	
	@Override
	public void insertFreeBoard(BoardVO vo) {
		boardDAO.insertFreeBoard(vo);
		System.out.println("=====자유게시판 등록");
		
	}
	@Override
	public void updateFreeBoard(BoardVO vo) {
		boardDAO.updateFreeBoard(vo);
		System.out.println("=====자유게시판 수정");
	}
	@Override
	public BoardVO detailFreeBoard(BoardVO vo) {
		System.out.println("=====자유게시판 상세");
		return boardDAO.detailFreeBoard(vo);
	}
	
	
	
	
///////////////////////////////////////////////////////////////			
	
	
//FAQ b6
@Override
public BoardVO faq(BoardVO vo) {
System.out.println("=====faq");//확인용
return boardDAO.faq(vo);
}

//minhak
@Override
public List<BoardVO> mainBoard(BoardVO vo) {
	return boardDAO.mainBoard(vo);
}



///////////////////////////////////////////////////////////////			

	






	
	
	

}
