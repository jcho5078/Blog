package com.jcho5078.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.service.UserService;
import com.jcho5078.blog.vo.UserVO;

public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public void insertUser(UserVO vo) {
		
		userDAO.insertUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		
		userDAO.deleteUser(vo);
	}

	@Override
	public UserVO getUserForm(String id) {
		return userDAO.getUserForm(id);
	}

	@Override
	public UserVO getUserFormForUserDetail(String id) throws Exception {
		return userDAO.getUserFormForUserDetail(id);
	}

	@Override
	public void updatePrivateUser(UserVO vo) {
		userDAO.updatePrivateUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}

	@Override
	public List<UserVO> selectUser(UserVO vo) {
		return userDAO.selectUser(vo);
	}

}
