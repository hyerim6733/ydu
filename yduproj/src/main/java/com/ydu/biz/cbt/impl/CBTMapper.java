package com.ydu.biz.cbt.impl;

import java.util.List;

import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTSubjectVO;
import com.ydu.biz.cbt.CBTVO;

public interface CBTMapper {

	List<CBTListVO> getAllCBT();

	List<CBTListVO> getMyCBT(CBTListVO vo);

	CBTListVO getCBT(CBTListVO vo);

	List<CBTVO> getAllGrades(CBTVO vo);

	List<CBTVO> getMyGrade(CBTVO vo);

	void insertTest(CBTSubjectVO vo);

	void getTest(CBTSubjectVO vo);

}