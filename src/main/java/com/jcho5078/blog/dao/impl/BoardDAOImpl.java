package com.jcho5078.blog.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.vo.BoardVO;

public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> BoardList() {
		
		return sqlSession.selectList("board.BoardList");
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

}
