package com.jcho5078.blog.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.vo.BoardNumVO;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.CommVO;
import com.jcho5078.blog.vo.PageVO;

public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> BoardList(BoardNumVO vo) {
		
		List<BoardVO> result = sqlSession.selectList("board.BoardList", vo);
		
		return result;
	}

	@Override
	public BoardVO selectBoard(int bdnum) {
		
		BoardVO result = sqlSession.selectOne("board.selectBoard", bdnum);
		
		return result;
	}

	@Override
	public void insertBoard(BoardVO vo) {
		
		sqlSession.insert("board.insertBoard", vo);
	}

	@Override
	public void deleteBoardUser(BoardVO vo) {
		
		sqlSession.delete("board.deleteBoardUser", vo);
	}
	
	@Override
	public void deleteBoard(BoardVO vo) {
		
		sqlSession.delete("board.deleteBoard", vo);
	}

	@Override
	public int getCount() {
		
		return sqlSession.selectOne("board.boardCount");
	}

	@Override
	public void countView(int bdnum) {
		
		sqlSession.update("board.boardViewCount", bdnum);
	}

	@Override
	public List<CommVO> CommList(int bdnum) {
		
		return sqlSession.selectList("board.selectComm", bdnum);
	}

	@Override
	public void insertComm(CommVO vo) {
		
		sqlSession.insert("board.insertComment", vo);
	}

	@Override
	public int countComm(int bdnum) {
		
		return sqlSession.selectOne("board.countComm", bdnum);
	}

	@Override
	public void insertBoardCommCount(int bdnum) {
		
		sqlSession.update("board.insertBoardCommCount", bdnum);
	}

	@Override
	public int getMaxCommNo(int bdnum) {
		
		return sqlSession.selectOne("board.getMaxCommNo", bdnum);
	}

	@Override
	public void deleteComm(CommVO vo) {
		
		sqlSession.delete("board.deleteComment", vo);
	}

	@Override
	public void deleteCommUser(CommVO vo) {
		
		sqlSession.delete("board.deleteCommentUser", vo);
	}

	@Override
	public void insertBoardCommCountMin(int bdnum) {
		
		sqlSession.update("board.insertBoardCommCountMin", bdnum);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		
		sqlSession.insert("board.insertFile", map);
	}
}
