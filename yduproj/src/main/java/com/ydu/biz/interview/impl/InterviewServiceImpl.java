package com.ydu.biz.interview.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.interview.InterStatusVO;
import com.ydu.biz.interview.InterviewService;
import com.ydu.biz.interview.InterviewVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.board.impl.BoardMapper;
import com.ydu.biz.classes.ClassListVO;

@Service("InterviewService")
public class InterviewServiceImpl implements InterviewService {
	
	@Autowired
	InterviewMapper interviewDAO;

	@Override
	public List<InterviewVO> getInterveiwList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertInterview(InterStatusVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInterview(StudentVO vo) {
		// TODO Auto-generated method stub
		
	}

}
