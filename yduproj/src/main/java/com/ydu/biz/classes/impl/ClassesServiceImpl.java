package com.ydu.biz.classes.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.classes.ClassesSearchVO;
import com.ydu.biz.classes.ClassesService;
import com.ydu.biz.classes.ClassListVO;

@Service("ClassesService")
public class ClassesServiceImpl implements ClassesService {
	
	@Autowired
	ClassesMapper ClassesDAO;
	
	public void insertClasses(ClassListVO vo){
		ClassesDAO.insertClasses(vo);
	}
	
	public void deleteClasses(ClassListVO vo){
		ClassesDAO.deleteClasses(vo);
	}

	@Override
	public ClassListVO getClasses(ClassListVO vo) {
		// TODO Auto-generated method stub
		return ClassesDAO.getClasses(vo);
	}

	@Override
	public List<ClassListVO> getClassesList(ClassesSearchVO vo) {
		return ClassesDAO.getClassesList(vo);
	}

	
	
	
}
