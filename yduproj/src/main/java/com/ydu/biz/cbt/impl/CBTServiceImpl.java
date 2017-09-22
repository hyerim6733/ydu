package com.ydu.biz.cbt.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.board.BoardVO;
import com.ydu.biz.cbt.CBTExampackVO;
import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTResultVO;
import com.ydu.biz.cbt.CBTService;


@Service("cbtService")
public class CBTServiceImpl implements CBTService {   

	@Autowired
	CBTMapper cbtDAO;
	
	public CBTServiceImpl() {
		System.out.println("cbt service impl 연결" );
	}
	
	/* 
	 * table 
	 * 1. cbt_list 
	 * 2. cbt_check => cbt
	 * 3. cbt_subject
	 */
	@Override
	public List<Map<String, Object>> getAllCBT() {
		System.out.println("impl get all cbt");
		return cbtDAO.getAllCBT();
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getMyCBT(com.ydu.biz.cbt.CBTListVO)
	 */
	@Override
	public List<CBTListVO> getMyCBT(String stu_code) {
		return cbtDAO.getMyCBT(stu_code);
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getCBT(com.ydu.biz.cbt.CBTListVO)
	 */
	@Override
	public CBTListVO getCBT(CBTListVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	

	@Override
	public List<CBTResultVO> getAllGrades(String vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override //[학생:결과 조회]Jung
	public List<Map<String, Object>> getMyGrade(CBTResultVO cbtResultvo) {
		return cbtDAO.getMyGrade(cbtResultvo);
	}
	//[교수:시험지 등록,수정,상세,삭제]Jung
	@Override
	public void insertTestList(CBTListVO vo) {
		cbtDAO.insertTestList(vo);
	}
	//[교수:문제 등록,수정,상세,삭제]Jung
	@Override
	public void insertTest(CBTExampackVO vo) {
		cbtDAO.insertTest(vo);
	}
	@Override //[교수:문제 조회]Jung
	public List<CBTExampackVO> getProfQuesList(int cbt_code) {
		return cbtDAO.getProfQuesList(cbt_code);
	}


	@Override
	public List<Map<String, Object>> getTest(int cbt_code) {
		return cbtDAO.getTest(cbt_code);
	}

	@Override
	public List<CBTListVO> getCBTInfo(int cbt_code) {
		return cbtDAO.getCBTInfo(cbt_code);
	}

	@Override
	public CBTExampackVO getMarkTest(CBTExampackVO vo) {
		return cbtDAO.getMarkTest(vo);
	}

	@Override
	public void insertMark(CBTResultVO vo) {
		cbtDAO.insertMark(vo);
		
	}

	

}
