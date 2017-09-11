package com.ydu.biz.interview.impl;

import java.util.List;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.interview.InterStatusVO;
import com.ydu.biz.interview.InterviewVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.classes.ClassListVO;

public interface InterviewMapper {
	
	// SELECT
		List<InterviewVO> getInterveiwList();

	// INSERT
		void insertInterview(InterStatusVO vo);
			
	// DELETE
		void deleteInterview(StudentVO vo);
		
}
