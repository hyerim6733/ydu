package com.ydu.biz.classes.impl;

import java.util.List;
import java.util.Map;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.classes.ClassListVO;

public interface ClassMapper {

				// �닔媛뺤떊泥�
				void insertClass(ClassStatusVO vo);
				 
				// �닔媛� 痍⑥냼(�궘�젣)
				void deleteClass(ClassStatusVO vo);
				
				// �닔媛뺢낵紐� �긽�꽭 議고쉶
				ClassListVO getClasses(ClassListVO vo);
				

				// 수강 신청 목록 조회
				List<Map<String, Object>> getClassesList();
				
				List<ClassStatusVO> getSelStuClassesList(StudentVO vo);

}
