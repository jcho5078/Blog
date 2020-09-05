package com.jcho5078.blog.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.user.CustomUserDetails;
import com.jcho5078.blog.vo.UserVO;

public class UserDAOImpl implements UserDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public CustomUserDetails login(String id) {
		
		return sqlSession.selectOne("user.login", id);
	}

	@Override
	public UserVO getEnabled(String id) {
		
		return sqlSession.selectOne("user.selectEnabled", id);
	}

	@Override
	public void insertUser(UserVO vo) {
		
		sqlSession.insert("user.insertUser", vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		
		sqlSession.delete("user.deleteUser", vo);
	}

	@Override
	public void updatePrivateUser(UserVO vo) {
		
		sqlSession.update("user.updatePrivateUser", vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		
		sqlSession.update("user.updateUser", vo);
	}

	@Override
	public List<UserVO> selectUser(UserVO vo) {
		
		return sqlSession.selectList("user.viewUser", vo);
	}
	
	@Override
	public UserVO getUserForm(String id) {
		
		return sqlSession.selectOne("user.getUserForm", id);
	}

	@Override
	public UserVO getUserFormForUserDetail(String id) throws Exception {
		
		UserVO vo = null;
		
		try {
			vo = sqlSession.selectOne("user.getUserForm", id);
		}catch (Exception e) {
			System.out.println("getUserFormForUserDetail 에러");
		}
		
		return vo;
	}

}
