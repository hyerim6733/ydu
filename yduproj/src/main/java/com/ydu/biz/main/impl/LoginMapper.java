package com.ydu.biz.main.impl;

import java.util.List;

import com.ydu.biz.main.LoginVO;
import com.ydu.biz.main.ProfessorVO;
import com.ydu.biz.main.StudentVO;


public interface LoginMapper {
	
	//로그인
	public LoginVO getUser(LoginVO vo);
	
	//중복체크
	public boolean getUser();

	//학생정보
	public StudentVO getStudentInfo(StudentVO vo);
	
	//교수정보
	public ProfessorVO getProfessorInfo(ProfessorVO vo);
}
