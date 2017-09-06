package com.ydu.biz.cbt;

import java.util.List;

public interface CBTService {

	/**
	 * Table name : cbt_list
	 * 1. 교수 : 모든 시험 조회 가능  (타교수 시험 모두!)
	 * 
	 * 2. 학생 : 내가 수강신청한 시험의 목록만 조회가능
	 * 			class_code 와 학생의 수강신청 목록 안에 class_code가 있어야됨,,
	 */
	
	//1.교수
	List<CBTListVO> getAllCBT( /*LoginVO vo */ );
	
	//2.학생
	List<CBTListVO> getMyCBT(CBTListVO vo);
	
	//3.공통 상세 조회
	CBTListVO getCBT(CBTListVO vo);
	
	
	/**
	 * Table name : cbt_check
	 * 1.교수 : 내가 출제한 시험에서, 수강학생들의 점수를 조회가능
	 * 2.학생 : 개인 점수만 조회가능
	 *
	 */
	//1. 교수
	List<CBTVO> getAllGrades(CBTVO vo);
	
	//2. 학생
	List<CBTVO> getMyGrade(CBTVO vo);
	
	
	
	/**
	 * Table name : cbt_subject
	 * 1. 교수 : 시험문제 제출
	 * 2. 학생 : 시험응시
	 */
	//1. 교수
	void insertTest(CBTSubjectVO vo);
	
	//2. 학생
	void getTest(CBTSubjectVO vo);
	
	
}