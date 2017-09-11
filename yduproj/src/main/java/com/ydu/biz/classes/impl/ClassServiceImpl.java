package com.ydu.biz.classes.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.board.impl.BoardMapper;
import com.ydu.biz.classes.ClassListVO;

@Service("ClassesService")
public class ClassServiceImpl implements ClassService {
	
	@Autowired
	ClassMapper classDAO;
	


	@Override
	public void insertClass(ClassStatusVO vo) {
		classDAO.insertClass(vo);
		System.out.println("�떊泥� : " +vo.getClassNo());
	}

	@Override
	public void deleteClass(ClassStatusVO vo) {
		classDAO.deleteClass(vo);
		System.out.println("�떊泥�痍⑥냼");
		
	}
	


	@Override
	public ClassListVO getClasses(ClassListVO vo) {
		System.out.println("媛뺤쓽怨꾪쉷�꽌");
		return classDAO.getClasses(vo);
		
	}

	@Override

	public List<Map<String, Object>> getClassesList() {
		System.out.println("수강 전체 목록 조회");
		return classDAO.getClassesList();
	}

	@Override
	public List<ClassStatusVO> getSelStuClassesList(StudentVO vo) {
		vo.setStudent_code("201711400");
		System.out.println("해당학생의 시간표 목록을 불러왔습니다.");
		return classDAO.getSelStuClassesList(vo);
	}

	

	
	
	
}
