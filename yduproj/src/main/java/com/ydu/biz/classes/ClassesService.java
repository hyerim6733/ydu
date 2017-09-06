package com.ydu.biz.classes;

import java.util.List;

public interface ClassesService {

		// 수강신청
		void insertClasses(ClassListVO vo);
		
		// 수강 취소(삭제)
		void deleteClasses(ClassListVO vo);
		
		// 수강과목 상세 조회
		ClassListVO getClasses(ClassListVO vo);
		
		// 수강 신청 목록 조회
		List<ClassListVO> getClassesList(ClassesSearchVO vo);

		
		
}
