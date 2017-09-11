package com.ydu.biz.cbt.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public List<CBTResultVO> getMyGrade(String vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTest(CBTExampackVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CBTExampackVO> getTest() {
		return cbtDAO.getTest();
	}

	@Override
	public List<CBTListVO> getCBTInfo(CBTListVO vo) {
		return cbtDAO.getCBTInfo(vo);
	}

}
