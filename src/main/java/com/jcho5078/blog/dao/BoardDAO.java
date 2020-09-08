package com.jcho5078.blog.dao;

import java.util.List;

import com.jcho5078.blog.vo.BoardVO;

public interface BoardDAO {
	
	//게시판 리스트 출력
	public List<BoardVO> BoardList();;
	//선택한 게시판 내용 출력
	public BoardVO selectBoard(BoardVO vo);
	//게시글 작성
	public void insertBoard(BoardVO vo);
	//게시글 삭제
	public void deleteBoard(BoardVO vo);
	
}