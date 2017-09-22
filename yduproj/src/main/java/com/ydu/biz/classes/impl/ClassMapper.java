package com.ydu.biz.classes.impl;

import java.util.List;
import java.util.Map;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.classes.ClassTimeVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.classes.ClassListVO;

public interface ClassMapper {

				// �닔媛뺤떊泥�
				void insertClass(Map<String, Object> vo);
				 
				// �닔媛� 痍⑥냼(�궘�젣)
				void deleteClass(ClassStatusVO vo);
				
				// �닔媛뺢낵紐� �긽�꽭 議고쉶
				Map<String, Object> getClasses(ClassListVO vo);
				

				// 수강 신청 목록 조회
				//List<Map<String, Object>> getClassesList(ClassSearchVO vo);

				List<Map<String, Object>> getsmallList(String code);
				
				// 수강 신청 목록 가져오기 (민학)
				List<Map<String, Object>> getClassList();
				
				List<ClassStatusVO> getSelStuClassesList(StudentVO vo);

				//강의 계획서 조회
				List<Map<String, Object>> getProgramList(ClassSearchVO vo);
				
				List<Map<String, Object>> getSelCurrClassesList(ClassStatusVO vo);
}
