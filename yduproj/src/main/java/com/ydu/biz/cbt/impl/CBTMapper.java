package com.ydu.biz.cbt.impl;

import java.util.List;
import java.util.Map;

import com.ydu.biz.board.BoardVO;
import com.ydu.biz.cbt.CBTExampackVO;
import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTResultVO;

public interface CBTMapper {

	List<Map<String, Object>> getAllCBT();

	List<CBTListVO> getMyCBT(String stu_code);


	List<CBTResultVO> getAllGrades(String prof_code);

	List<CBTResultVO> getMyGrade(String stu_code);

	

	List<Map<String, Object>> getTest(int cbt_code);
	
	List<CBTListVO> getCBTInfo(int cbt_code);
	
	
	
	
	

	CBTListVO getCBT(CBTListVO vo);
	//[교수:시험지 등록,수정,상세,삭제]Jung
	void insertTestList(CBTListVO vo); //등록
	//void updateNotice(CBTListVO vo); //수정
	//BoardVO detailNotice(CBTListVO vo); //상세
	//void deleteBoardList(CBTListVO vo);//삭제
	
	
	
	CBTExampackVO getMarkTest(CBTExampackVO vo);
	//[교수:문제 등록,수정,상세,삭제]Jung
	List<CBTExampackVO> getProfQuesList(int cbt_code);//문제조회
	void insertTest(CBTExampackVO vo); //등록
	//void updateTest(CBTExampackVO vo); //수정
	//BoardVO detailTest(CBTExampackVO vo); //상세
	//void deleteTest(CBCBTExampackVOTListVO vo);//삭제
	
	

}