package com.ydu.biz.cbt.impl;

import java.util.List;
import java.util.Map;

import com.ydu.biz.cbt.CBTExampackVO;
import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTResultVO;

public interface CBTMapper {

	List<Map<String, Object>> getAllCBT();

	List<CBTListVO> getMyCBT(String stu_code);

	CBTListVO getCBT(CBTListVO vo);

	List<CBTResultVO> getAllGrades(String prof_code);

	List<CBTResultVO> getMyGrade(String stu_code);

	void insertTest(CBTExampackVO vo);

	List<Map<String, Object>> getTest(int cbt_code);
	
	List<CBTListVO> getCBTInfo(int cbt_code);
	
	CBTExampackVO getMarkTest(CBTExampackVO vo);

}