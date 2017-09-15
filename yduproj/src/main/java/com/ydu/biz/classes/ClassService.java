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
		void insertClass(ClassStatusVO vo);
		
		// 수강 취소(삭제)
		void deleteClass(ClassStatusVO vo);
		
		//교수
		// 성적입력
		
		
		// 수강과목 상세 조회
		Map<String, Object> getClasses(ClassListVO vo);
		

		// 수강 신청 목록 조회
		List<Map<String, Object>> getClassesList(/*ClassListVO vo*/);

		//code
		List<Map<String, Object>> getsmallList(String code);
		


		
		List<ClassStatusVO> getSelStuClassesList(StudentVO vo);
		
}
