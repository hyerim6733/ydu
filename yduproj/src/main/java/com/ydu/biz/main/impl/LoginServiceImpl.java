package com.ydu.biz.main.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydu.biz.main.LoginService;
import com.ydu.biz.main.LoginVO;

@Service("usersService")
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginMapper userDAO;

	@Override
	public LoginVO getUser(LoginVO vo) {
		return userDAO.getUser(vo);

	}

	@Override
	public boolean getUser() {
		// TODO Auto-generated method stub
		return false;
	}
}
