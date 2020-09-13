package com.jcho5078.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.PageVO;

public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> BoardList(PageVO vo) {
		
		return boardDAO.BoardList(vo);
	}
	
	@Override
	public BoardVO selectBoard(int bdnum) {
		
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

}
