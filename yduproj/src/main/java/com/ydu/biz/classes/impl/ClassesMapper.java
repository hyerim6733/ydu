package com.ydu.biz.classes.impl;

import java.util.List;

import com.ydu.biz.classes.ClassesSearchVO;
import com.ydu.biz.classes.ClassListVO;

public interface ClassesMapper {

				// 수강신청
				void insertClasses(ClassListVO vo);
				
				// 수강 취소(삭제)
				void deleteClasses(ClassListVO vo);
				
				// 수강과목 상세 조회
				ClassListVO getClasses(ClassListVO vo);
				
				// 수강 신청 목록 조회
				List<ClassListVO> getClassesList(ClassesSearchVO vo);
}
