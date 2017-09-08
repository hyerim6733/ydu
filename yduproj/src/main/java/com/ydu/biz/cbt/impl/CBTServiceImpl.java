package com.ydu.biz.cbt.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTService;
import com.ydu.biz.cbt.CBTSubjectVO;
import com.ydu.biz.cbt.CBTVO;

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
	public List<CBTListVO> getAllCBT() {
		System.out.println("impl get all cbt");
		return cbtDAO.getAllCBT();
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getMyCBT(com.ydu.biz.cbt.CBTListVO)
	 */
	@Override
	public List<CBTListVO> getMyCBT(CBTListVO vo) {
		return cbtDAO.getMyCBT(vo);
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getCBT(com.ydu.biz.cbt.CBTListVO)
	 */
	@Override
	public CBTListVO getCBT(CBTListVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getAllGrades(com.ydu.biz.cbt.CBTVO)
	 */
	@Override
	public List<CBTVO> getAllGrades(CBTVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getMyGrade(com.ydu.biz.cbt.CBTVO)
	 */
	@Override
	public List<CBTVO> getMyGrade(CBTVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#insertTest(com.ydu.biz.cbt.CBTSubjectVO)
	 */
	@Override
	public void insertTest(CBTSubjectVO vo) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.ydu.biz.cbt.impl.CBTMapper#getTest(com.ydu.biz.cbt.CBTSubjectVO)
	 */
	@Override
	public void getTest(CBTSubjectVO vo) {
		// TODO Auto-generated method stub
		
	}

}
