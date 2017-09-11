package com.ydu.biz.interview;

import java.util.List;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.classes.ClassListVO;

public interface InterviewService {

	// SELECT
	List<InterviewVO> getInterveiwList();

	// INSERT
		void insertInterview(InterStatusVO vo);
			
	// DELETE
		void deleteInterview(StudentVO vo);
}
