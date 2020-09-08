package com.jcho5078.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.vo.BoardVO;

public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> BoardList() {
		
		return boardDAO.BoardList();
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
