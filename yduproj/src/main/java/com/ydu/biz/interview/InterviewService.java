package com.ydu.biz.interview;

import java.util.List;
import java.util.Map;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.classes.ClassListVO;

public interface InterviewService {

	// SELECT
	List<Map<String, Object>> getInterveiwList();

	// INSERT
		void insertInterview(InterStatusVO vo);
			
	// DELETE
		void deleteInterview(StudentVO vo);
}
