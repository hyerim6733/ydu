package com.ydu.biz.classes.impl;

import java.util.List;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.classes.ClassListVO;

public interface ClassMapper {

				// 수강신청
				void insertClass(ClassStatusVO vo);
				
				// 수강 취소(삭제)
				void deleteClass(ClassStatusVO vo);
				
				// 수강과목 상세 조회
				ClassListVO getClasses(ClassListVO vo);
				
				// 수강 신청 목록 조회
				List<ClassListVO> getClassesList();
}
