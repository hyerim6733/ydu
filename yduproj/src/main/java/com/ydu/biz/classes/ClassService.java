package com.ydu.biz.classes;

import java.util.List;

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
		ClassListVO getClasses(ClassListVO vo);
		
		// 수강 신청 목록 조회
		List<ClassListVO> getClassesList(/*ClassListVO vo*/);

		

		
		
}
