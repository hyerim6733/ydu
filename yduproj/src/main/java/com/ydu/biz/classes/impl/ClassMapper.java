package com.ydu.biz.classes.impl;

import java.util.List;

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
				
				// �닔媛� �떊泥� 紐⑸줉 議고쉶
				List<ClassListVO> getClassesList();
				
				List<ClassStatusVO> getSelStuClassesList(StudentVO vo);
}
