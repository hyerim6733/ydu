package com.ydu.biz.classes.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.classes.ClassTimeVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.board.impl.BoardMapper;
import com.ydu.biz.classes.ClassListVO;

@Service("ClassesService")
public class ClassServiceImpl implements ClassService {
	
	@Autowired
	ClassMapper classDAO;
	


	@Override
	public void insertClass(Map<String, Object> vo) {
		classDAO.insertClass(vo);
	}

	@Override
	public void deleteClass(ClassStatusVO vo) {
		classDAO.deleteClass(vo);		
	}
	


	@Override
	public Map<String, Object> getClasses(ClassListVO vo) {
		System.out.println("媛뺤쓽怨꾪쉷�꽌");
		return classDAO.getClasses(vo);
		
	}
	
	
/*
	@Override
	public List<Map<String, Object>> getClassesList(ClassSearchVO vo) {
		System.out.println("수강 전체 목록 조회");
		return classDAO.getClassesList(vo);
	}*/
	
	@Override
	public List<Map<String, Object>> getsmallList(String code) {
		System.out.println("코드테이블");
		return classDAO.getsmallList(code);
	}
	

	@Override
	public List<ClassStatusVO> getSelStuClassesList(StudentVO vo) {
		vo.setStudentCode("5049452");
		System.out.println("해당학생의 시간표 목록을 불러왔습니다.");
		return classDAO.getSelStuClassesList(vo);
	}

	@Override
	public List<Map<String, Object>> getProgramList(ClassSearchVO vo) {
		System.out.println("수강 전체 목록 조회");
		return classDAO.getProgramList(vo);
	}

	@Override
	public List<Map<String, Object>> getClassList() {
		return classDAO.getClassList();
	}

	@Override
	public List<Map<String, Object>> getSelCurrClassesList(ClassStatusVO vo) {
		return classDAO.getSelCurrClassesList(vo);
	}

	
	

	
	
	
}
