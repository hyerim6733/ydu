package com.ydu.biz.cbt.impl;

import java.util.List;

import com.ydu.biz.cbt.CBTExampackVO;
import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTResultVO;

public interface CBTMapper {

	List<CBTListVO> getAllCBT();

	List<CBTListVO> getMyCBT(String stu_code);

	CBTListVO getCBT(CBTListVO vo);

	List<CBTResultVO> getAllGrades(String prof_code);

	List<CBTResultVO> getMyGrade(String stu_code);

	void insertTest(CBTExampackVO vo);

	List<CBTResultVO> getTest();

}