package com.ydu.biz.classes.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.board.impl.BoardMapper;
import com.ydu.biz.classes.ClassListVO;

@Service("ClassesService")
public class ClassServiceImpl implements ClassService {
	
	@Autowired
	ClassMapper classDAO;
	


	@Override
	public void insertClass(ClassStatusVO vo) {
		classDAO.insertClass(vo);
		System.out.println("신청 : " +vo.getClassNo());
	}

	@Override
	public void deleteClass(ClassStatusVO vo) {
		classDAO.deleteClass(vo);
		System.out.println("신청취소");
		
	}
	


	@Override
	public ClassListVO getClasses(ClassListVO vo) {
		System.out.println("강의계획서");
		return classDAO.getClasses(vo);
		
	}

	@Override
	public List<ClassListVO> getClassesList() {
		System.out.println("수강 전체 목록 조회");
		return classDAO.getClassesList();
	}

	

	
	
	
}
