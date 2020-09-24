package com.jcho5078.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.vo.BoardNumVO;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.PageVO;

public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public List<BoardVO> BoardList(BoardNumVO vo) {
		
		return boardDAO.BoardList(vo);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO selectBoard(int bdnum) {
		
		boardDAO.countView(bdnum);
		return boardDAO.selectBoard(bdnum);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		
		boardDAO.insertBoard(vo);
	}

	@Override
	public void deleteBoardUser(BoardVO vo) {
		
		boardDAO.deleteBoardUser(vo);
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		
		boardDAO.deleteBoard(vo);
	}

	@Override
	public int getCount() {
		
		return boardDAO.getCount();
	}
}
