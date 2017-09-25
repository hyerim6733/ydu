package com.ydu.biz.classes;

import java.util.List;
import java.util.Map;



import com.ydu.biz.main.StudentVO;

public interface ClassService {
	
	/**
	 * Table name : class_status
	 * 1. 교수 : 학생 성적 입력
	 * 2. 학생 : 수강신청
	 */
		
		// 학생
		// 수강신청
		void insertClass(Map<String, Object> vo);
		
		// 수강 취소(삭제)
		void deleteClass(ClassStatusVO vo);
		
		//교수
		// 성적입력
		
		
		// 수강과목 상세 조회
		Map<String, Object> getClasses(ClassListVO vo);
		

		// 수강 신청 목록 조회
		List<Map<String, Object>> getProgramList(ClassSearchVO vo);

		//code
		List<Map<String, Object>> getsmallList(String code);
		

		
		List<ClassStatusVO> getSelStuClassesList(StudentVO vo);

		//List<Map<String, Object>> getClassesList(ClassSearchVO vo);
		
		List<Map<String, Object>> getSelCurrClassesList(ClassStatusVO vo);
		
		// 수강 신청 목록 가져오기 (민학)
		List<Map<String, Object>> getClassList();
		
		//민학 강의계획서 조회
		Map<String, Object> getClassPlan(ClassPlanVO vo);
}
