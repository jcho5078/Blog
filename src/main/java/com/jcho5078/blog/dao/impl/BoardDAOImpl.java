package com.jcho5078.blog.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.PageVO;

public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> BoardList(PageVO vo) {
		
		return sqlSession.selectList("board.BoardList", vo);
	}

	@Override
	public BoardVO selectBoard(int bdnum) {
		
		return sqlSession.selectOne("board.selectBoard", bdnum);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		
		sqlSession.insert("board.insertBoard", vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
		sqlSession.delete("board.deleteBoard", vo);
	}

}
