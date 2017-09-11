package com.ydu.biz.classes;

import java.util.List;

import com.ydu.biz.main.StudentVO;

public interface ClassService {
	
	/**
	 * Table name : class_status
	 * 1. 援먯닔 : �븰�깮 �꽦�쟻 �엯�젰
	 * 2. �븰�깮 : �닔媛뺤떊泥�
	 */
		
		// �븰�깮
		// �닔媛뺤떊泥�
		void insertClass(ClassStatusVO vo);
		
		// �닔媛� 痍⑥냼(�궘�젣)
		void deleteClass(ClassStatusVO vo);
		
		//援먯닔
		// �꽦�쟻�엯�젰
		
		
		// �닔媛뺢낵紐� �긽�꽭 議고쉶
		ClassListVO getClasses(ClassListVO vo);
		
		// �닔媛� �떊泥� 紐⑸줉 議고쉶
		List<ClassListVO> getClassesList(/*ClassListVO vo*/);

		
		List<ClassStatusVO> getSelStuClassesList(StudentVO vo);
}
