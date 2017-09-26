package com.ydu.biz.cbt;

import java.util.List;
import java.util.Map;

import com.ydu.biz.main.StudentVO;

public interface CBTService {

	/**
	 * Table name : cbt_list
	 * 1. 교수 : 모든 시험 조회 가능  (타교수 시험 모두!)
	 * 
	 * 2. 학생 : 내가 수강신청한 시험의 목록만 조회가능
	 * 			class_code 와 학생의 수강신청 목록 안에 class_code가 있어야됨,,
	 */
	
	//1.교수
	List<Map<String, Object>> getAllCBT( /*LoginVO vo */ );
	
	//2.학생
	List<CBTListVO> getMyCBT(String stu_code);
	
	//3.공통 상세 조회
	CBTListVO getCBT(CBTListVO vo);
	
	
	/**
	 * Table name : cbt_check
	 * 1.교수 : 내가 출제한 시험에서, 수강학생들의 점수를 조회가능
	 * 2.학생 : 개인 점수만 조회가능
	 *
	 */
	//1. 교수:jung
	List<CBTResultVO> getAllGrades(String prof_code);
	
	//2. 학생:jung
	List<Map<String, Object>> getMyGrade(CBTResultVO cbtResultvo);
	List<Map<String, Object>> getAllMyGrade(CBTResultVO cbtResultvo);//응시한 시험 전체
	
	
	
	/**
	 * Table name : cbt_subject
	 * 1. 교수 : 시험문제 제출
	 * 2. 학생 : 시험응시
	 */
	//1. 교수
	//[교수:문제 등록,수정,상세,삭제]Jung
	List<CBTExampackVO> getProfQuesList(int cbt_code);//문제조회
	void insertTest(CBTExampackVO vo);
	//[교수:시험지 등록,수정,상세,삭제]Jung
	void insertTestList(CBTListVO vo);//등록
	
	
	
	void insertMark(CBTResultVO vo); //채점 점수 등록
	
	
	//2. 학생
	List<Map<String, Object>> getTest(int cbt_code);

	
	//3. 시험제목 눌렀을 때, 중간화면. 시험안내 페이지.
	List<CBTListVO> getCBTInfo(int cbt_code);
	
	
	/**
	 * 시험 채점
	 */
	CBTExampackVO getMarkTest(CBTExampackVO vo);

	
	//4. CBT COMENT (MINHAK)
	List<Map<String, Object>> getCbtComent();
	
	// COMMENT INSERT
	void insertComent(CBTComentVO vo);
	
	// COMMENT RE SELECT
	List<Map<String, Object>> getCbtComentRe();	
}